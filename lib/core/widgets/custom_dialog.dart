import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/primary_button.dart';

Future<void> showCustomDialog({
  required BuildContext context,
  required String title,
  String? content,
  required Future<void> Function() onConfirm,
  String? confirmText,
  Color? confirmColor,
  Future<void> Function()? onCancel,
  String? cancelText,
  bool reverseButtons = false,
}) => showDialog(
  context: context,
  builder: (_) => CustomDialog(
    title: title,
    content: content,
    onConfirm: onConfirm,
    confirmText: confirmText,
    confirmColor: confirmColor,
    onCancel: onCancel,
    cancelText: cancelText,
    reverseButtons: reverseButtons,
  ),
);

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    this.content,
    required this.onConfirm,
    this.confirmText,
    this.confirmColor,
    this.onCancel,
    this.cancelText,
    this.reverseButtons = false,
  });

  final String title;
  final String? content;
  final Future<void> Function() onConfirm;
  final String? confirmText;
  final Color? confirmColor;
  final Future<void> Function()? onCancel;
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
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: context.txt(
                color: vrc(context).textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),

            if (content != null)
              Text(content!, style: TextStyle(fontSize: 13, height: 1.5)),
            const SizedBox(height: 6),

            Row(
              children: [
                Expanded(
                  child: PrimaryButton.mono(
                    text: cancelText ?? '취소',
                    onTap: () async {
                      if (onCancel != null) await onCancel!();
                      if (context.mounted) Navigator.pop(context, false);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryButton(
                    text: confirmText ?? '확인',
                    onTap: () async {
                      await onConfirm();
                      if (context.mounted) Navigator.pop(context, true);
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
