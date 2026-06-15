import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';

import 'package:trana/core/theme/app_theme.dart';

class ContractField extends HookConsumerWidget {
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType? keyboardType;
  final bool hasError;
  final void Function(String)? onChanged;

  const ContractField({
    super.key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.keyboardType,
    this.hasError = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onChanged: onChanged ?? (v) {},
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      style: context.txt(color: vrc(context).textPrimary),
      cursorColor: fxc(context).brandColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.txt(color: vrc(context).textDisable),
        filled: true,
        fillColor: vrc(context).secondaryColor,
        isCollapsed: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: hasError
              ? BorderSide(color: fxc(context).statusError!, width: 1)
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: hasError
              ? BorderSide(color: fxc(context).iconDanger!)
              : BorderSide(color: fxc(context).brandColor!),
        ),
      ),
    );
  }
}
