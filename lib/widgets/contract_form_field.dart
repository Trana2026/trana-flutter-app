import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/widgets/contract_field.dart';

class ContractFormField extends HookConsumerWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int maxLines;
  final Widget? trailing;

  const ContractFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.trailing,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                label,
                style: TextStyle(
                  color: vrc(context).textTertiary,
                  fontSize: 15,
                  fontFamily: "PretendardMedium"
                ),
              ),
            ),
            if (trailing != null) ...[const SizedBox(width: 6), trailing!],
          ],
        ),
        const SizedBox(height: 6),
        ContractField(
          hintText: hintText,
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
