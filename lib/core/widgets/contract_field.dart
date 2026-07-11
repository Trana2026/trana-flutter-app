import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';

/// 계약서 입력에 사용하는 스타일 통일 TextField
class ContractField extends HookConsumerWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool hasError;
  final void Function(String)? onChanged;
  final bool readOnly;

  const ContractField({
    super.key,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.minLines,
    this.maxLines = 1,
    this.keyboardType,
    this.inputFormatters,
    this.hasError = false,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      focusNode: focusNode,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      onChanged: onChanged ?? (v) {},
      controller: controller,
      minLines: minLines ?? maxLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textAlignVertical: TextAlignVertical.center,
      style: context.txt(color: vrc(context).textPrimary),
      cursorColor: fxc(context).textInfo,
      cursorHeight: 14,
      cursorWidth: 1,
      readOnly: readOnly,
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
          borderSide: readOnly
              ? BorderSide.none
              : hasError
              ? BorderSide(color: fxc(context).iconDanger!)
              : BorderSide(color: fxc(context).brandColor!),
        ),
      ),
    );
  }
}
