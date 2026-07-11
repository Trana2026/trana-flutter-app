import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

OverlayEntry? _currentEntry;

/// 알림용 토스트 (title, detail 분리)
void showNormalToast(BuildContext context, String title, String? detail) =>
    _showOverlayToast(context, title, detail, isError: false);

/// 에러용 토스트 (message 단독)
void showErrorToast(BuildContext context, String message) =>
    _showOverlayToast(context, message, null, isError: true);

void _showOverlayToast(
  BuildContext context,
  String title,
  String? detail, {
  required bool isError,
}) {
  _currentEntry?.remove();
  _currentEntry = null;

  // context 가 deactivate 되기 전에 theme 값 미리 추출
  final opacityBg = fxc(context).opacityBg!;
  final iconBgColor = isError
      ? fxc(context).statusError!
      : fxc(context).brandColor!;
  final textColor = fxc(context).textBrand!;
  final overlayState = Overlay.of(context);

  final entry = OverlayEntry(
    builder: (ctx) => Positioned(
      bottom: 110,
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
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: iconBgColor,
                ),
                child: Center(
                  child: Icon(
                    isError ? Icons.close : Icons.check,
                    size: 14,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontFamily: 'PretendardMedium',
                        height: 1.5,
                        letterSpacing: 0.16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (!isError && detail != null)
                      Text(
                        detail,
                        style: TextStyle(
                          fontSize: 12,
                          color: textColor,
                          height: 1.5,
                          letterSpacing: 0.16,
                        ),
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
