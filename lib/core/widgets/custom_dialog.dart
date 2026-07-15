import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/primary_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    this.content,
    required this.confirmText,
    required this.onConfirm,
    this.confirmColor,
    this.cancelText,
    this.reverseButtons = false,
  });

  final String title;
  final String? content;
  final String confirmText;
  final void Function() onConfirm;
  final Color? confirmColor;
  final String? cancelText;
  final bool reverseButtons;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: vrc(context).background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 25,
          children: [
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                if (content != null) ...[
                  const SizedBox(height: 12),
                  Text(content!, style: TextStyle(fontSize: 13, height: 1.5)),
                ],
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton.mono(
                    text: cancelText ?? '취소',
                    onTap: () => Navigator.pop(context, false),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryButton(
                    text: confirmText,
                    onTap: () {
                      onConfirm();
                      Navigator.pop(context, true);
                    },
                    backgroundColor: confirmColor ?? fxc(context).brandColor!,
                    foregroundColor: fxc(context).textBrand!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
