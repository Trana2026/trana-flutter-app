#!/usr/bin/env python3
"""Lottie 파일을 lottie-flutter 호환으로 변환

디자이너가 애니메이션을 갱신할 때마다 재적용:
    python3 tool/fix_lottie.py <입력.json> <출력.json>

적용되는 변환 4종 (플레이어 간 렌더링 차이를 만드는 기능 제거):
  1. slots 인라인      — sid 참조를 실제 값으로 치환 (lottie-flutter sid 미지원, 크래시 원인)
  2. blur 파서 패치    — Gaussian Blur 내부 이펙트의 중복 ty:0을 ty:7로 (blurriness 덮어쓰기 방지)
  3. 글로우 변환       — "단색 원 + Gaussian Blur" 레이어를 방사형 그라데이션으로 (블러 의존 제거)
  4. skew 제거         — skew 레이어를 SVD 분해로 치환 (Skew·Rotation·Scale Transform 널 체인)
"""
import copy
import json
import math
import sys


def inline_slots(d):
    slots = d.get('slots', {})
    if not slots:
        return 0
    count = 0

    def resolve(node):
        nonlocal count
        if isinstance(node, dict):
            for key, val in list(node.items()):
                if isinstance(val, dict) and val.get('sid') in slots:
                    node[key] = copy.deepcopy(slots[val['sid']]['p']['k'])
                    count += 1
                else:
                    resolve(val)
        elif isinstance(node, list):
            for x in node:
                resolve(x)

    resolve(d.get('layers', []))
    resolve(d.get('assets', []))
    return count


def fix_blur_inner_ty(d):
    count = 0

    def walk(node):
        nonlocal count
        if isinstance(node, dict):
            if node.get('ty') == 29 and isinstance(node.get('ef'), list):
                seen = False
                for e in node['ef']:
                    if e.get('ty') == 0:
                        if not seen:
                            seen = True
                        else:
                            e['ty'] = 7
                            count += 1
            for v in node.values():
                walk(v)
        elif isinstance(node, list):
            for x in node:
                walk(x)

    walk(d)
    return count


def _path_bbox(shapes):
    pts = []

    def walk(ss):
        for s in ss:
            if s.get('ty') == 'gr':
                walk(s.get('it', []))
            elif s.get('ty') == 'sh':
                k = s.get('ks', {}).get('k')
                if isinstance(k, dict) and 'v' in k:
                    pts.extend(k['v'])

    walk(shapes)
    if not pts:
        return None
    xs = [q[0] for q in pts]
    ys = [q[1] for q in pts]
    return min(xs), min(ys), max(xs), max(ys)


def _find_solid_fill(shapes):
    for s in shapes:
        if s.get('ty') == 'gr':
            r = _find_solid_fill(s.get('it', []))
            if r:
                return r
        elif s.get('ty') == 'fl':
            return s['c']['k']
    return None


def blur_layers_to_gradient(d):
    """단색 fill + Gaussian Blur 레이어를 방사형 그라데이션 원으로 교체"""
    count = 0
    ST = {'a': 0}

    def convert(layers):
        nonlocal count
        for L in layers:
            has_blur = any(e.get('ty') == 29 for e in (L.get('ef') or []))
            if not (has_blur and 'shapes' in L):
                continue
            col = _find_solid_fill(L['shapes'])
            bbox = _path_bbox(L['shapes'])
            if col is None or bbox is None:
                continue
            blurriness = 0
            for e in L['ef']:
                if e.get('ty') == 29:
                    for inner in e.get('ef', []):
                        if inner.get('ty') == 0:
                            blurriness = inner.get('v', {}).get('k', 0)
                            break
            sigma = blurriness * 0.57735 + 0.5
            cx, cy = (bbox[0] + bbox[2]) / 2, (bbox[1] + bbox[3]) / 2
            radius = max(bbox[2] - bbox[0], bbox[3] - bbox[1]) / 2 + sigma * 1.5
            r, g, b = col[:3]
            gk = [0, r, g, b, 0.55, r, g, b, 1, r, g, b, 0, 1, 0.55, 0.5, 1, 0]
            L['shapes'] = [{
                'ty': 'gr', 'nm': 'GlowCircle', 'it': [
                    {'ty': 'el', 's': {**ST, 'k': [2 * radius, 2 * radius]},
                     'p': {**ST, 'k': [cx, cy]}},
                    {'ty': 'gf', 't': 2, 'r': 1, 'o': {**ST, 'k': 100},
                     's': {**ST, 'k': [cx, cy]}, 'e': {**ST, 'k': [cx + radius, cy]},
                     'g': {'p': 3, 'k': {**ST, 'k': gk}}},
                    {'ty': 'tr', 'p': {**ST, 'k': [0, 0]}, 'a': {**ST, 'k': [0, 0]},
                     's': {**ST, 'k': [100, 100]}, 'r': {**ST, 'k': 0},
                     'o': {**ST, 'k': 100}},
                ]}]
            L.pop('ef', None)
            count += 1

    convert(d.get('layers', []))
    for a in d.get('assets', []):
        if 'layers' in a:
            convert(a['layers'])
    return count


def _svd2x2(m):
    """2x2 행렬을 회전(θ1)·스케일(sx,sy)·회전(θ2)으로 분해 (M = R(θ1)·S·R(θ2))"""
    a, b, c, dd = m[0][0], m[0][1], m[1][0], m[1][1]
    e, f = (a + dd) / 2, (a - dd) / 2
    g, h = (c + b) / 2, (c - b) / 2
    q = math.hypot(e, h)
    r_ = math.hypot(f, g)
    sx, sy = q + r_, q - r_
    a1, a2 = math.atan2(g, f), math.atan2(h, e)
    theta1 = (a2 + a1) / 2
    theta2 = (a2 - a1) / 2
    return math.degrees(theta1), sx, sy, math.degrees(theta2)


def decompose_skew(d):
    """skew가 걸린 레이어를 널 체인(R1 ← S ← 레이어 R2)으로 치환"""
    count = 0
    ST = {'a': 0}
    layers = d.get('layers', [])
    next_ind = max((l.get('ind', 0) for l in layers), default=0) + 100
    new_layers = []
    for L in layers:
        ks = L.get('ks', {})
        sk_v = ks.get('sk', {}).get('k', 0)
        if not sk_v or L.get('parent') is not None:
            new_layers.append(L)
            continue
        # 정적 트랜스폼만 지원 (애니메이션 skew는 미지원)
        if any(isinstance(ks.get(key, {}).get('k'), list) and ks[key]['k'] and
               isinstance(ks[key]['k'][0], dict) for key in ('s', 'sk', 'sa', 'r')):
            print(f"  경고: '{L.get('nm')}' skew가 애니메이션됨 — 건너뜀")
            new_layers.append(L)
            continue
        sx, sy = [v / 100 for v in ks['s']['k'][:2]]
        sk = math.radians(sk_v)
        sa = math.radians(ks.get('sa', {}).get('k', 0))
        rot = math.radians(ks.get('r', {}).get('k', 0))
        anchor = ks['a']['k'][:2]
        pos = ks['p']['k'][:2]

        def matmul(x, y):
            return [[x[0][0] * y[0][0] + x[0][1] * y[1][0],
                     x[0][0] * y[0][1] + x[0][1] * y[1][1]],
                    [x[1][0] * y[0][0] + x[1][1] * y[1][0],
                     x[1][0] * y[0][1] + x[1][1] * y[1][1]]]

        def rotm(t):
            return [[math.cos(t), -math.sin(t)], [math.sin(t), math.cos(t)]]

        # lottie-web 기준 skew 행렬 (A 규약: shear = -tan(sk))
        shear = [[1, -math.tan(sk)], [0, 1]]
        lin = matmul(matmul(rotm(rot), matmul(matmul(rotm(sa), shear), rotm(-sa))),
                     [[sx, 0], [0, sy]])
        t1, s1, s2, t2 = _svd2x2(lin)

        grand = {'ty': 3, 'nm': f"bake_R1_{L.get('nm', '')}", 'ind': next_ind,
                 'ip': L['ip'], 'op': L['op'], 'st': L.get('st', 0),
                 'ks': {'a': {**ST, 'k': [0, 0]}, 'p': {**ST, 'k': pos},
                        's': {**ST, 'k': [100, 100]}, 'r': {**ST, 'k': t1},
                        'o': {**ST, 'k': 100}}}
        par = {'ty': 3, 'nm': f"bake_S_{L.get('nm', '')}", 'ind': next_ind + 1,
               'parent': next_ind, 'ip': L['ip'], 'op': L['op'], 'st': L.get('st', 0),
               'ks': {'a': {**ST, 'k': [0, 0]}, 'p': {**ST, 'k': [0, 0]},
                      's': {**ST, 'k': [s1 * 100, s2 * 100]}, 'r': {**ST, 'k': 0},
                      'o': {**ST, 'k': 100}}}
        L['parent'] = next_ind + 1
        L['ks'] = {'a': {**ST, 'k': anchor + [0]}, 'p': {**ST, 'k': [0, 0]},
                   's': {**ST, 'k': [100, 100]}, 'r': {**ST, 'k': t2},
                   'sk': {**ST, 'k': 0}, 'sa': {**ST, 'k': 0}, 'o': ks['o']}
        next_ind += 2
        new_layers.extend([grand, par, L])
        count += 1
        print(f"  '{L.get('nm')}': R1={t1:.2f}° S=({s1*100:.1f},{s2*100:.1f})% R2={t2:.2f}°")
    d['layers'] = new_layers
    return count


def main():
    if len(sys.argv) != 3:
        print(__doc__)
        sys.exit(1)
    src, dst = sys.argv[1], sys.argv[2]
    d = json.load(open(src))
    print(f"slots 인라인: {inline_slots(d)}곳")
    print(f"blur 파서 패치: {fix_blur_inner_ty(d)}곳")
    print(f"글로우 그라데이션 변환: {blur_layers_to_gradient(d)}개 레이어")
    print(f"skew 분해: {decompose_skew(d)}개 레이어")
    json.dump(d, open(dst, 'w'), separators=(',', ':'), ensure_ascii=False)
    print(f"저장: {dst}")


if __name__ == '__main__':
    main()
