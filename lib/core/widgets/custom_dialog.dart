import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

class CustomDialog extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final isPending = useState(false);

    return PopScope(
      canPop: !isPending.value,
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                color: vrc(context).background,
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
                      Text(
                        content!,
                        style: TextStyle(
                          color: vrc(context).textTertiary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: -0.12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton.mono(
                            text: cancelText ?? '취소',
                            onTap: () async {
                              if (isPending.value) return;
                              isPending.value = true;
                              try {
                                if (onCancel != null) await onCancel!();
                                if (context.mounted) {
                                  Navigator.pop(context, false);
                                }
                              } finally {
                                if (context.mounted) isPending.value = false;
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: PrimaryButton(
                            text: confirmText ?? '확인',
                            onTap: () async {
                              if (isPending.value) return;
                              isPending.value = true;
                              try {
                                await onConfirm();
                                if (context.mounted) {
                                  Navigator.pop(context, true);
                                }
                              } finally {
                                if (context.mounted) isPending.value = false;
                              }
                            },
                            backgroundColor:
                                confirmColor ?? fxc(context).brandColor!,
                            foregroundColor: fxc(context).unchangeableWhite!,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isPending.value)
                const Positioned.fill(
                  child: ModalBarrier(
                    dismissible: false,
                    color: Colors.black12,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
