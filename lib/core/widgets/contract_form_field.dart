import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/contract_field.dart';

/// 레이블 + ContractField 조합의 폼 입력 위젯
class ContractFormField extends HookConsumerWidget {
  final String label;
  final String hintText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final void Function(String)? onChanged;

  const ContractFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: context.txt(
                color: vrc(context).textTertiary,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ContractField(
          onChanged: onChanged,
          hintText: hintText,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          hasError: errorText != null,
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorText!,
              style: context.txt(color: fxc(context).textDanger, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
