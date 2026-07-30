// app_theme.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trana/core/theme/fixed_colors.dart';
import 'package:trana/core/theme/variable_colors.dart';

/// 앱 라이트/다크 테마 정의
class AppTheme {
  static const _fontFamily = 'Pretendard'; // 앱 전역 폰트 적용

  /// AppBar 상태바 오버레이 (투명 → AppBar 배경색 노출, 아이콘 명암만 테마별 지정)
  static const _statusLight = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // Android: 밝은 배경 → 어두운 아이콘
    statusBarBrightness: Brightness.light, // iOS
  );
  static const _statusDark = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  /// 라이트 모드 테마
  static ThemeData light = ThemeData(
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      systemOverlayStyle: _statusLight,
    ),
    brightness: Brightness.light,
    fontFamily: _fontFamily,
    extensions: const [VariableColors.light, FixedColors.constant],
  );

  /// 다크 모드 테마
  static ThemeData dark = ThemeData(
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      systemOverlayStyle: _statusDark,
    ),
    brightness: Brightness.dark,
    fontFamily: _fontFamily,
    extensions: const [VariableColors.dark, FixedColors.constant],
  );
}

/// 현재 테마의 VariableColors (모드에 따라 달라지는 색상)
VariableColors vrc(BuildContext context) =>
    Theme.of(context).extension<VariableColors>()!;

/// 현재 테마의 FixedColors (모드에 관계없이 고정된 색상)
FixedColors fxc(BuildContext context) =>
    Theme.of(context).extension<FixedColors>()!;
