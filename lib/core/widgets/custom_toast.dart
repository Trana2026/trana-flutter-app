import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/app_icon.dart';

OverlayEntry? _currentEntry;

/// 알림용 토스트
void showNormalToast(BuildContext context, String message, {String? detail}) =>
    _showOverlayToast(
      context,
      message,
      detail,
      customIcon: null,
      appIcon: AppIcon.data(icon: Icons.check),
      iconColor: fxc(context).unchangeableWhite,
      iconBgColor: fxc(context).brandColor!,
    );

/// 에러용 토스트
void showErrorToast(BuildContext context, String message, {String? detail}) =>
    _showOverlayToast(
      context,
      message,
      detail,
      customIcon: null,
      appIcon: AppIcon.data(icon: Icons.close),
      iconColor: fxc(context).unchangeableWhite,
      iconBgColor: fxc(context).statusError!,
    );

/// 커스텀 토스트 (icon 커스텀)
void showCustomToast(
  BuildContext context,
  String message, {
  String? detail,
  required AppIcon customAppIcon,
}) => _showOverlayToast(
  context,
  message,
  detail,
  customIcon: customAppIcon,
  appIcon: null,
  iconColor: null,
  iconBgColor: null,
);

void _showOverlayToast(
  BuildContext context,
  String message,
  String? detail, {
  AppIcon? customIcon,
  AppIcon? appIcon,
  Color? iconColor,
  Color? iconBgColor,
}) {
  _currentEntry?.remove();
  _currentEntry = null;

  // context 가 deactivate 되기 전에 theme 값 미리 추출
  final opacityBg = fxc(context).opacityBg!;
  final textColor = fxc(context).unchangeableWhite!;
  final overlayState = Overlay.of(context);

  final entry = OverlayEntry(
    builder: (ctx) => Positioned(
      bottom: MediaQuery.of(ctx).padding.bottom + 80,
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 63,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: opacityBg,
          ),
          child: Row(
            children: [
              customIcon ??
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: iconBgColor,
                    ),
                    child: Center(
                      child: appIcon?.copyWith(size: 14, color: iconColor),
                    ),
                  ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        letterSpacing: -0.14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (detail != null)
                      Text(
                        detail,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          letterSpacing: -0.12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  _currentEntry = entry;
  overlayState.insert(entry);

  Future.delayed(const Duration(seconds: 2), () {
    _currentEntry?.remove();
    _currentEntry = null;
  });
}
