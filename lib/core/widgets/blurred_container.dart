import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

/// 블러 처리 + opacityBg 색상의 컨테이너 (배너, 스낵바 UI)
class BlurredContainer extends StatelessWidget {
  const BlurredContainer({
    super.key,
    required this.child,
    this.height,
    this.blurLevel = 10,
  });

  final Widget child;
  final double? height;
  final double blurLevel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurLevel, sigmaY: blurLevel),
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: fxc(context).opacityBg,
          ),
          child: child,
        ),
      ),
    );
  }
}
