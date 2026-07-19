import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_bottom_sheet.dart';
import 'package:trana/features/auth/presentation/screens/terms/widgets/terms_agreement_bottom_sheet.dart';

class IntroPage extends HookConsumerWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bg = vrc(context).background!;
    final scale = MediaQuery.sizeOf(context).width / 375;

    // 버튼 하단(top 702 + height 52) + 여백. 이 높이가 화면보다 클 때만 스크롤됨
    final contentHeight = 754.0 + 32.0;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final stackHeight = math.max(contentHeight * scale, screenHeight);

    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: SizedBox(
          height: stackHeight,
          child: Stack(
            children: [
              // 배경 블러 글로우
              // const IntroGlowBackground(),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 812 * scale,
                child: IgnorePointer(
                  child: Lottie.asset(
                    'assets/anim/onboarding.json',
                    width: double.infinity,
                    height: 812 * scale,
                    fit: BoxFit.fitWidth,
                    animate: true,
                    repeat: true,
                    frameRate: FrameRate.max,
                  ),
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
                      fontFamily: 'PretendardBold',
                      height: 1.2,
                      letterSpacing: -0.28 * scale,
                      color: vrc(context).textPrimary,
                    ),
                    children: [
                      const TextSpan(text: '가장 안전한 중고 거래,\n'),
                      TextSpan(
                        text: '트라나',
                        style: TextStyle(color: fxc(context).brandColor),
                      ),
                      const TextSpan(text: '에서 시작하세요!'),
                    ],
                  ),
                ),
              ),

              // 서브타이틀
              Positioned(
                left: 20 * scale,
                top: 562 * scale,
                child: Text(
                  '거래 조건을 명확히 기록하고, 본인 인증을 통해\n'
                  '법적 효력이 있는 계약을 체결하세요',
                  style: TextStyle(
                    fontSize: 14 * scale,
                    fontFamily: 'PretendardMedium',
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
        ),
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
        onTap: () =>
            showCustomBottomSheet(context, const TermsAgreementBottomSheet()),
        child: Center(
          child: Text(
            '본인 인증하여 시작하기',
            style: TextStyle(
              fontSize: 16 * scale,
              fontFamily: 'PretendardSemiBold',
              letterSpacing: -0.16 * scale,
              color: fxc(context).textBrand,
            ),
          ),
        ),
      ),
    );
  }
}
