import 'package:flutter/material.dart';

/// 라이트/다크 모드에 관계없이 고정된 브랜드·상태·아이콘 색상
@immutable
class FixedColors extends ThemeExtension<FixedColors> {
  const FixedColors({
    required this.brandColor,
    required this.statusSignRequest,
    required this.statusSignSuccess,
    required this.statusModifyRequest,
    required this.statusError,
    required this.statusDraft,
    required this.textBrand,
    required this.subtitleGreen,
    required this.subtitleBlue,
    required this.subtitleError,
    required this.subtitleWarning,
    required this.subtitleKakao,
    required this.textGreen,
    required this.textDanger,
    required this.textInfo,
    required this.iconBrand,
    required this.iconDanger,
    required this.iconInfo,
    required this.borderOP,
    required this.borderKakao,
    required this.opacitySuccess,
    required this.opacityBg,
    required this.opacityError,
    required this.imageCountBg,
    required this.trustScore,
    required this.unchangeableBlack,
    required this.unchangeableWhite,
  });
  final Color? brandColor;
  final Color? statusSignRequest;
  final Color? statusSignSuccess;
  final Color? statusModifyRequest;
  final Color? statusError;
  final Color? statusDraft;
  final Color? textBrand;
  final Color? subtitleGreen;
  final Color? subtitleBlue;
  final Color? subtitleError;
  final Color? subtitleWarning;
  final Color? subtitleKakao;
  final Color? textGreen;
  final Color? textDanger;
  final Color? textInfo;
  final Color? iconBrand;
  final Color? iconDanger;
  final Color? iconInfo;
  final Color? borderOP;
  final Color? borderKakao;
  final Color? opacitySuccess;
  final Color? opacityBg;
  final Color? opacityError;
  final Color? imageCountBg;
  final Color? trustScore;
  final Color? unchangeableBlack;
  final Color? unchangeableWhite;

  static const FixedColors constant = FixedColors(
    brandColor: Color(0xFF40C572),
    statusSignRequest: Color(0xFF2563EB),
    statusSignSuccess: Color(0xFF2B7FFF),
    statusModifyRequest: Color(0xFFFF8904),
    statusDraft: Color(0xFF565957),
    statusError: Color(0xFFEF4444),
    textBrand: Color(0xFFFFFFFF),
    subtitleGreen: Color(0x1F40C572),
    subtitleBlue: Color(0x1F2B7FFF),
    subtitleError: Color(0x1FEF4444),
    subtitleWarning: Color(0x1FFF8904),
    subtitleKakao: Color(0x1FFACC15),
    textGreen: Color(0xFF40C572),
    textDanger: Color(0xFFEF4444),
    textInfo: Color(0xFF2B7FFF),
    iconBrand: Color(0xFF40C572),
    iconDanger: Color(0xFFEF4444),
    iconInfo: Color(0xFF2B7FFF),
    borderOP: Color(0x406F7270),
    borderKakao: Color(0xFFFACC15),
    opacitySuccess: Color(0x1F00C950),
    opacityBg: Color(0x8041444F),
    opacityError: Color(0x1FFB2C36),
    imageCountBg: Color(0x66424242),
    trustScore: Color(0xFFBAF863),
    unchangeableBlack: Color(0xFF272829),
    unchangeableWhite: Color(0xFFFFFFFF),
  );

  /// 일부 필드를 교체한 새 FixedColors 인스턴스 생성
  @override
  FixedColors copyWith({
    Color? brandColor,
    Color? statusSignRequest,
    Color? statusSignSuccess,
    Color? statusModifyRequest,
    Color? statusError,
    Color? statusDraft,
    Color? textBrand,
    Color? subtitleGreen,
    Color? subtitleBlue,
    Color? subtitleError,
    Color? subtitleWarning,
    Color? subtitleKakao,
    Color? textGreen,
    Color? textDanger,
    Color? textInfo,
    Color? iconBrand,
    Color? iconDanger,
    Color? iconInfo,
    Color? borderOP,
    Color? borderKakao,
    Color? opacitySuccess,
    Color? opacityBg,
    Color? opacityError,
    Color? imageCountBg,
    Color? trustScore,
    Color? unchangeableBlack,
    Color? unchangeableWhite,
  }) => FixedColors(
    brandColor: brandColor ?? this.brandColor,
    statusSignRequest: statusSignRequest ?? this.statusSignRequest,
    statusSignSuccess: statusSignSuccess ?? this.statusSignSuccess,
    statusModifyRequest: statusModifyRequest ?? this.statusModifyRequest,
    statusError: statusError ?? this.statusError,
    statusDraft: statusDraft ?? this.statusDraft,
    textBrand: textBrand ?? this.textBrand,
    subtitleGreen: subtitleGreen ?? this.subtitleGreen,
    subtitleBlue: subtitleBlue ?? this.subtitleBlue,
    subtitleError: subtitleError ?? this.subtitleError,
    subtitleWarning: subtitleWarning ?? this.subtitleWarning,
    subtitleKakao: subtitleKakao ?? this.subtitleKakao,
    textGreen: textGreen ?? this.textGreen,
    textDanger: textDanger ?? this.textDanger,
    textInfo: textInfo ?? this.textInfo,
    iconBrand: iconBrand ?? this.iconBrand,
    iconDanger: iconDanger ?? this.iconDanger,
    iconInfo: iconInfo ?? this.iconInfo,
    borderOP: borderOP ?? this.borderOP,
    borderKakao: borderKakao ?? this.borderKakao,
    opacitySuccess: opacitySuccess ?? this.opacitySuccess,
    opacityBg: opacityBg ?? this.opacityBg,
    opacityError: opacityError ?? this.opacityError,
    imageCountBg: imageCountBg ?? this.imageCountBg,
    trustScore: trustScore ?? this.trustScore,
    unchangeableBlack: unchangeableBlack ?? this.unchangeableBlack,
    unchangeableWhite: unchangeableWhite ?? this.unchangeableWhite,
  );

  /// 두 FixedColors 사이를 선형 보간
  @override
  FixedColors lerp(ThemeExtension<FixedColors>? other, double t) {
    if (other is! FixedColors) return this;
    return FixedColors(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      statusSignRequest: Color.lerp(
        statusSignRequest,
        other.statusSignRequest,
        t,
      ),
      statusSignSuccess: Color.lerp(
        statusSignSuccess,
        other.statusSignSuccess,
        t,
      ),
      statusModifyRequest: Color.lerp(
        statusModifyRequest,
        other.statusModifyRequest,
        t,
      ),
      statusError: Color.lerp(statusError, other.statusError, t),
      statusDraft: Color.lerp(statusDraft, other.statusDraft, t),
      textBrand: Color.lerp(textBrand, other.textBrand, t),
      subtitleGreen: Color.lerp(subtitleGreen, other.subtitleGreen, t),
      subtitleBlue: Color.lerp(subtitleBlue, other.subtitleBlue, t),
      subtitleError: Color.lerp(subtitleError, other.subtitleError, t),
      subtitleWarning: Color.lerp(subtitleWarning, other.subtitleWarning, t),
      subtitleKakao: Color.lerp(subtitleKakao, other.subtitleKakao, t),
      textGreen: Color.lerp(textGreen, other.textGreen, t),
      textDanger: Color.lerp(textDanger, other.textDanger, t),
      textInfo: Color.lerp(textInfo, other.textInfo, t),
      iconBrand: Color.lerp(iconBrand, other.iconBrand, t),
      iconDanger: Color.lerp(iconDanger, other.iconDanger, t),
      iconInfo: Color.lerp(iconInfo, other.iconInfo, t),
      borderOP: Color.lerp(borderOP, other.borderOP, t),
      borderKakao: Color.lerp(borderKakao, other.borderKakao, t),
      opacitySuccess: Color.lerp(opacitySuccess, other.opacitySuccess, t),
      opacityBg: Color.lerp(opacityBg, other.opacityBg, t),
      opacityError: Color.lerp(opacityError, other.opacityError, t),
      imageCountBg: Color.lerp(imageCountBg, other.imageCountBg, t),
      trustScore: Color.lerp(trustScore, other.trustScore, t),
      unchangeableBlack: Color.lerp(
        unchangeableBlack,
        other.unchangeableBlack,
        t,
      ),
      unchangeableWhite: Color.lerp(
        unchangeableWhite,
        other.unchangeableWhite,
        t,
      ),
    );
  }
}
