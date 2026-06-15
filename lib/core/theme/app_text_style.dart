import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

/// 텍스트 기본 스타일 지정
/// style: context.txt() 에서 파라미터로 값 변경해서 사용
extension AppTextStyle on BuildContext {
  TextStyle txt({
    Color? color,
    FontWeight fontWeight = FontWeight.w500,
    double fontSize = 14,
    double height = 1.5,
  }) {
    return TextStyle(
      color: color ?? vrc(this).textSecondary, // 색상 기본값: textSecondary
      fontWeight: fontWeight, // 굵기 기본값: Medium (w500)
      fontSize: fontSize, // 크기 기본값: 14
      height: height, // 행간 기본값: 150%
      letterSpacing: fontSize * -0.01, // 자간 기본값: -1%
    );
  }
}
