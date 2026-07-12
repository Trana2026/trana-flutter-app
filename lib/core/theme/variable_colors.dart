import 'package:flutter/material.dart';

/// 라이트/다크 모드에 따라 달라지는 배경·텍스트·아이콘·보더 색상
@immutable
class VariableColors extends ThemeExtension<VariableColors> {
  const VariableColors({
    required this.background,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.disableColor,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisable,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.iconDisable,
    required this.borderPrimary,
    required this.borderSecondary,
  });
  final Color? background;
  final Color? secondaryColor;
  final Color? tertiaryColor;
  final Color? disableColor;
  final Color? textPrimary;
  final Color? textSecondary;
  final Color? textTertiary;
  final Color? textDisable;
  final Color? iconPrimary;
  final Color? iconSecondary;
  final Color? iconDisable;
  final Color? borderPrimary;
  final Color? borderSecondary;

  static const VariableColors light = VariableColors(
    background: Color(0xFFFFFFFF),
    secondaryColor: Color(0xFFF6F8F9),
    tertiaryColor: Color(0xFFE9EBEC),
    disableColor: Color(0xFFEFF2F3),
    textPrimary: Color(0xFF272829),
    textSecondary: Color(0xFF565957),
    textTertiary: Color(0xFF6F7270),
    textDisable: Color(0xFFB5B7B6),
    iconPrimary: Color(0xFF1F2021),
    iconSecondary: Color(0xFF565957),
    iconDisable: Color(0xFFB5B7B6),
    borderPrimary: Color(0xFFE9EBEC),
    borderSecondary: Color(0xFFCDD0CE),
  );
  static const VariableColors dark = VariableColors(
    background: Color(0xFF18191A),
    secondaryColor: Color(0xFF1F2021),
    tertiaryColor: Color(0xFF272829),
    disableColor: Color(0xFF272829),
    textPrimary: Color(0xFFF6F8F9),
    textSecondary: Color(0xFFB5B7B6),
    textTertiary: Color(0xFF8A8D8B),
    textDisable: Color(0xFF6F7270),
    iconPrimary: Color(0xFFFFFFFF),
    iconSecondary: Color(0xFFB5B7B6),
    iconDisable: Color(0xFF6F7270),
    borderPrimary: Color(0xFF1F2021),
    borderSecondary: Color(0xFF272829),
  );

  /// 일부 필드를 교체한 새 VariableColors 인스턴스 생성
  @override
  VariableColors copyWith({
    Color? background,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? disableColor,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisable,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? iconDisable,
    Color? borderPrimary,
    Color? borderSecondary,
  }) => VariableColors(
    background: background ?? this.background,
    secondaryColor: secondaryColor ?? this.secondaryColor,
    tertiaryColor: tertiaryColor ?? this.tertiaryColor,
    disableColor: disableColor ?? this.disableColor,
    textPrimary: textPrimary ?? this.textPrimary,
    textSecondary: textSecondary ?? this.textSecondary,
    textTertiary: textTertiary ?? this.textTertiary,
    textDisable: textDisable ?? this.textDisable,
    iconPrimary: iconPrimary ?? this.iconPrimary,
    iconSecondary: iconSecondary ?? this.iconSecondary,
    iconDisable: iconDisable ?? this.iconDisable,
    borderPrimary: borderPrimary ?? this.borderPrimary,
    borderSecondary: borderSecondary ?? this.borderSecondary,
  );

  /// 두 VariableColors 사이를 선형 보간
  @override
  VariableColors lerp(ThemeExtension<VariableColors>? other, double t) {
    if (other is! VariableColors) return this;
    return VariableColors(
      background: Color.lerp(background, other.background, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t),
      disableColor: Color.lerp(disableColor, other.disableColor, t),
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t),
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t),
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t),
      textDisable: Color.lerp(textDisable, other.textDisable, t),
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t),
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t),
      iconDisable: Color.lerp(iconDisable, other.iconDisable, t),
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t),
      borderSecondary: Color.lerp(borderSecondary, other.borderSecondary, t),
    );
  }
}
