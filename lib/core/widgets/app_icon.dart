import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trana/core/theme/app_theme.dart';

/// 여러 경로의 아이콘 렌더링 통합 위젯
/// size 기본값 = 24, color 기본값 = vrc(context).iconPrimary
class AppIcon extends StatelessWidget {
  /// SVG 아이콘 : AppIcon.svg(asset: "assets/icons/file.svg")
  const AppIcon.svg({
    super.key,
    required String asset,
    this.size = 24,
    this.color,
  }) : _asset = asset,
       _icon = null;

  /// Coolicons / Material 아이콘 : AppIcon.data(icon: CooliconsIcon.file)
  const AppIcon.data({
    super.key,
    required IconData icon,
    this.size = 24,
    this.color,
  }) : _icon = icon,
       _asset = null;

  final String? _asset;
  final IconData? _icon;
  final double size;
  final Color? color;

  /// asset/icon은 유지한 채 size/color만 덮어쓴 새 인스턴스 생성
  AppIcon copyWith({double? size, Color? color}) {
    final asset = _asset;
    if (asset != null) {
      return AppIcon.svg(
        asset: asset,
        size: size ?? this.size,
        color: color ?? this.color,
      );
    }
    return AppIcon.data(
      icon: _icon!,
      size: size ?? this.size,
      color: color ?? this.color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? vrc(context).iconPrimary;
    final asset = _asset;

    if (asset != null) {
      return Center(
        child: SvgPicture.asset(
          asset,
          width: size,
          height: size,
          fit: BoxFit.contain,
          colorFilter: effectiveColor != null
              ? ColorFilter.mode(effectiveColor, BlendMode.srcIn)
              : null,
        ),
      );
    }
    return Center(
      child: Icon(_icon, size: size, color: effectiveColor),
    );
  }
}
