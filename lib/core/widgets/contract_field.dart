import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:trana/core/theme/app_theme.dart';

/// 계약서 입력에 사용하는 스타일 통일 TextField
class ContractField extends HookConsumerWidget {
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const ContractField({
    super.key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
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
          fontFamily: "PretendardMedium"
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
      ),
    );
  }
}