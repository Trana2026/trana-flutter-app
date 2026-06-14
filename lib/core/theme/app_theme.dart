// app_theme.dart
import 'package:flutter/material.dart';
import 'package:trana/core/theme/fixed_colors.dart';
import 'package:trana/core/theme/variable_colors.dart';

class AppTheme {
  static const _fontFamily = 'Pretendard'; // 앱 전역 폰트 적용

  static ThemeData light = ThemeData(
    appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
    brightness: Brightness.light,
    fontFamily: _fontFamily,
    extensions: const [VariableColors.light, FixedColors.constant],
  );

  static ThemeData dark = ThemeData(
    appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
    brightness: Brightness.dark,
    fontFamily: _fontFamily,
    extensions: const [VariableColors.dark, FixedColors.constant],
  );
}

VariableColors vrc(BuildContext context) =>
    Theme.of(context).extension<VariableColors>()!;

FixedColors fxc(BuildContext context) =>
    Theme.of(context).extension<FixedColors>()!;
