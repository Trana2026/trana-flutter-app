import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:trana/core/theme/app_theme.dart';

class ContractField extends HookConsumerWidget {
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final FormFieldValidator<String>? validator;

  const ContractField({
    super.key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.keyboardType,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      onChanged: onChanged ?? (v) {},
      validator: validator,
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        color: vrc(context).textPrimary,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
      cursorColor: fxc(context).brandColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: vrc(context).textDisable,
          fontSize: 15,
          fontFamily: "PretendardMedium",
        ),
        filled: true,
        fillColor: vrc(context).secondaryColor,
        isCollapsed: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }
}
