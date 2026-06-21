import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';

/// 약관 동의용 체크박스 (필수/선택 레이블 포함)
class ConsentCheckbox extends HookConsumerWidget {
  final String? requiredText;
  final String descriptionText;
  final Color? requiredColor;
  final ValueChanged<bool>? onChanged;

  const ConsentCheckbox({
    super.key,
    this.requiredText,
    required this.descriptionText,
    this.requiredColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = useState(false);

    return GestureDetector(
      onTap: () {
        isSelected.value = !isSelected.value;
        onChanged?.call(isSelected.value);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: vrc(context).secondaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: isSelected.value
                      ? fxc(context).brandColor
                      : vrc(context).background,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected.value
                        ? Colors.transparent
                        : vrc(context).textDisable!,
                    width: 2,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: vrc(context).textSecondary,
                    fontSize: 13,
                    fontFamily: "PretendardMedium",
                    height: 1.2,
                  ),
                  children: [
                    TextSpan(
                      text: requiredText,
                      style: TextStyle(
                        color: requiredColor ?? fxc(context).textInfo,
                        fontFamily: "PretendardBold"
                      ),
                    ),
                    TextSpan(
                      text: descriptionText,
                      style: TextStyle(color: vrc(context).textPrimary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
