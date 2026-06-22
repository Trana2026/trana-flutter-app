import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/auth/presentation/screens/intro/widgets/intro_glow_background.dart';

/// 서비스 소개 및 본인 인증 시작 진입 화면
class IntroPage extends HookConsumerWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bg = vrc(context).background!;
    // 피그마 와이어프레임 width(375) 대비 비례 스케일
    final s = MediaQuery.sizeOf(context).width / 375;

    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        children: [
          // 배경 블러 글로우
          const IntroGlowBackground(),

          // 에셋 일러스트 (격자 그리드 + 박스 + 점)
          Positioned(
            left: 0,
            right: 0,
            top: 118 * s,
            child: Image.asset(
              "assets/images/intro_hero.png",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),

          // 본문 가독성을 위한 배경색 페이드
          Positioned(
            left: 0,
            right: 0,
            top: 378 * s,
            height: 434 * s,
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
            left: 20 * s,
            top: 482 * s,
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 28 * s,
                  fontFamily: "PretendardBold",
                  height: 1.2,
                  letterSpacing: -0.28 * s,
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
            left: 20 * s,
            top: 562 * s,
            child: Text(
              "거래 조건을 명확히 기록하고, 본인 인증을 통해\n법적 효력이 있는 계약을 체결하세요",
              style: TextStyle(
                fontSize: 14 * s,
                fontFamily: "PretendardMedium",
                height: 1.5,
                letterSpacing: -0.14 * s,
                color: vrc(context).textSecondary,
              ),
            ),
          ),

          // 본인 인증 시작 버튼
          Positioned(
            left: 20 * s,
            top: 702 * s,
            width: 335 * s,
            height: 52 * s,
            child: _StartButton(scale: s),
          ),

          // 이미 계정이 있으신가요? 링크
          Positioned(
            left: 0,
            right: 0,
            top: 766 * s,
            child: Center(
              child: GestureDetector(
                onTap: () => context.push(AppRoutes.socialLogin),
                child: Text(
                  "이미 계정이 있으신가요?",
                  style: TextStyle(
                    fontSize: 12 * s,
                    fontFamily: "PretendardBold",
                    letterSpacing: -0.12 * s,
                    color: vrc(context).textSecondary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 본인 인증 플로우(나이 선택)로 진입하는 메인 CTA 버튼
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
        onTap: () => context.push(AppRoutes.selectAge),
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
