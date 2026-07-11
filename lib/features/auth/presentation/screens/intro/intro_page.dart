import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/auth/presentation/screens/intro/widgets/intro_glow_background.dart';

class IntroPage extends HookConsumerWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bg = vrc(context).background!;
    // 피그마 와이어프레임 width(375) 대비 비례 스케일
    // 글로우 등을 직접구현함에 따라 최대한 동일하게 화면을 구현하기위해 사용
    final scale = MediaQuery.sizeOf(context).width / 375;

    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        children: [
          // 배경 블러 글로우
          const IntroGlowBackground(),

          // 에셋 (격자그리드 + 박스 + 원형오브젝트)
          Positioned(
            left: 0,
            right: 0,
            top: 118 * scale,
            child: Image.asset(
              "assets/images/intro_hero.png",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),

          // 본문 배경색 페이드
          Positioned(
            left: 0,
            right: 0,
            top: 378 * scale,
            height: 434 * scale,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.4, 1.0],
                  colors: [bg.withValues(alpha: 0), bg, bg],
                ),
              ),
            ),
          ),

          // 타이틀
          Positioned(
            left: 20 * scale,
            top: 482 * scale,
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 28 * scale,
                  fontFamily: "PretendardBold",
                  height: 1.2,
                  letterSpacing: -0.28 * scale,
                  color: vrc(context).textPrimary,
                ),
                children: [
                  const TextSpan(text: "가장 안전한 중고 거래,\n"),
                  TextSpan(
                    text: "트라나",
                    style: TextStyle(color: fxc(context).brandColor),
                  ),
                  const TextSpan(text: "에서 시작하세요!"),
                ],
              ),
            ),
          ),

          // 서브타이틀
          Positioned(
            left: 20 * scale,
            top: 562 * scale,
            child: Text(
              "거래 조건을 명확히 기록하고, 본인 인증을 통해\n법적 효력이 있는 계약을 체결하세요",
              style: TextStyle(
                fontSize: 14 * scale,
                fontFamily: "PretendardMedium",
                height: 1.5,
                letterSpacing: -0.14 * scale,
                color: vrc(context).textSecondary,
              ),
            ),
          ),

          // 본인인증 시작 버튼
          Positioned(
            left: 20 * scale,
            top: 702 * scale,
            width: 335 * scale,
            height: 52 * scale,
            child: _StartButton(scale: scale),
          ),
        ],
      ),
    );
  }
}

class _StartButton extends StatelessWidget {
  const _StartButton({required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: fxc(context).brandColor,
      borderRadius: BorderRadius.circular(16 * scale),
      child: InkWell(
        borderRadius: BorderRadius.circular(16 * scale),
        // EKYC 플로우
        // PASS 전환으로 비활성. 재도입 시 아래 주석 해제
        // onTap: () => context.push(AppRoutes.selectAge),
        onTap: () => context.push(AppRoutes.terms),
        child: Center(
          child: Text(
            "본인 인증하여 시작하기",
            style: TextStyle(
              fontSize: 16 * scale,
              fontFamily: "PretendardSemiBold",
              letterSpacing: -0.16 * scale,
              color: fxc(context).textBrand,
            ),
          ),
        ),
      ),
    );
  }
}
