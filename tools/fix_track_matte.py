#!/usr/bin/env python3
"""Lottie 트랙 매트(track matte) 레이어 순서를 lottie-flutter 호환으로 교정

export된 결과물에서 매트 소스(td)를 매트 대상(tt) 아래에 있는 경우에 사용.
Lottie 규약상 매트 소스는 대상 '바로 위'(index-1)에 있어야 하며, lottie-flutter는
이 순서를 엄격히 따름. 순서가 뒤집히면 대상이 잘못된 매트에 클리핑되어 빈 화면이 됨.

    python3 tool/fix_track_matte.py <입력.json> <출력.json>

교정 규칙 (각 컨테이너의 layers 배열에서):
  어떤 레이어 i가 tt(매트 대상)를 갖고, 바로 위(i-1)가 td 매트가 아니며,
  바로 아래(i+1)가 td:1 매트이면 → i와 i+1을 스왑해 td를 대상 바로 위로 올림.
  (매트 레이어는 독립 렌더되지 않으므로 z-order 부작용 없음)

가드: tt가 최상단이거나 이미 바로 위가 td인 정상 케이스는 건드리지 않음.
"""
import json
import sys


def _is_matte_source(layer):
    return layer is not None and layer.get('td') == 1


def _reorder(layers, path, log):
    count = 0
    i = 0
    while i < len(layers):
        cur = layers[i]
        above = layers[i - 1] if i > 0 else None
        below = layers[i + 1] if i + 1 < len(layers) else None

        needs_fix = (
            cur.get('tt') is not None
            and not _is_matte_source(cur)
            and not _is_matte_source(above)
            and _is_matte_source(below)
        )
        if needs_fix:
            layers[i], layers[i + 1] = layers[i + 1], layers[i]
            log.append(
                f"  {path}: '{cur.get('nm')}'(tt) ↔ "
                f"'{below.get('nm')}'(td) 스왑"
            )
            count += 1
            i += 2  # 스왑된 두 레이어는 재검사하지 않음
            continue
        i += 1
    return count


def reorder_track_mattes(d):
    """최상위 layers와 모든 프리컴프 layers의 뒤집힌 트랙 매트 순서를 교정"""
    log = []
    count = _reorder(d.get('layers', []), 'root', log)
    for a in d.get('assets', []):
        if 'layers' in a:
            count += _reorder(a['layers'], f"asset[{a.get('id', '')[:14]}]", log)
    for line in log:
        print(line)
    return count


def main():
    if len(sys.argv) != 3:
        print(__doc__)
        sys.exit(1)
    src, dst = sys.argv[1], sys.argv[2]
    d = json.load(open(src))
    print(f"트랙 매트 순서 교정: {reorder_track_mattes(d)}곳")
    json.dump(d, open(dst, 'w'), separators=(',', ':'), ensure_ascii=False)
    print(f"저장: {dst}")


if __name__ == '__main__':
    main()
