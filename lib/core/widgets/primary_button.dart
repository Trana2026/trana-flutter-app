import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';

enum _PrimaryButtonVariant { brand, mono, custom }

/// 앱 전반에서 사용하는 기본 전체너비 버튼
class PrimaryButton extends HookConsumerWidget {
  final String text;
  final bool disabled;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final _PrimaryButtonVariant _variant;

  /// 커스텀 색상 스타일
  const PrimaryButton({
    super.key,
    required this.text,
    this.disabled = false,
    required this.onTap,
    required this.backgroundColor,
    required this.foregroundColor,
  }) : _variant = _PrimaryButtonVariant.custom;

  /// 브랜드 컬러 스타일
  const PrimaryButton.brand({
    super.key,
    required this.text,
    this.disabled = false,
    required this.onTap,
  }) : backgroundColor = null,
       foregroundColor = null,
       _variant = _PrimaryButtonVariant.brand;

  /// 모노톤 스타일
  const PrimaryButton.mono({
    super.key,
    required this.text,
    this.disabled = false,
    required this.onTap,
  }) : backgroundColor = null,
       foregroundColor = null,
       _variant = _PrimaryButtonVariant.mono;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: disabled ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: disabled
              ? vrc(context).disableColor
              : _resolvedBackgroundColor(context),
          foregroundColor: disabled
              ? vrc(context).textDisable
              : _resolvedForegroundColor(context),
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Color? _resolvedBackgroundColor(BuildContext context) {
    switch (_variant) {
      case _PrimaryButtonVariant.brand:
        return fxc(context).brandColor;
      case _PrimaryButtonVariant.mono:
        return vrc(context).secondaryColor;
      case _PrimaryButtonVariant.custom:
        return backgroundColor;
    }
  }

  Color? _resolvedForegroundColor(BuildContext context) {
    switch (_variant) {
      case _PrimaryButtonVariant.brand:
        return fxc(context).textBrand;
      case _PrimaryButtonVariant.mono:
        return vrc(context).textPrimary;
      case _PrimaryButtonVariant.custom:
        return foregroundColor;
    }
  }
}
