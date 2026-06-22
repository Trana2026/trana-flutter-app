import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 소셜 로그인용 버튼 (카카오/구글/애플)
class SocialLoginButton extends HookConsumerWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final String title;

  /// 좌측 로고 SVG 에셋 경로
  final String? iconAsset;

  const SocialLoginButton({
    super.key,
    required this.onTap,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.title,
    this.iconAsset,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        // 좌측 로고 고정 + 타이틀 중앙 정렬
        child: Row(
          children: [
            const SizedBox(width: 18),
            SizedBox(
              width: 22,
              height: 22,
              child: iconAsset != null
                  ? SvgPicture.asset(iconAsset!, width: 22, height: 22)
                  : null,
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontFamily: "PretendardSemiBold",
                ),
              ),
            ),
            const SizedBox(width: 40),
          ],
        ),
      ),
    );
  }
}
