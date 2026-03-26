import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 

import 'package:trana/core/theme/app_theme.dart';

class ContractField extends HookConsumerWidget { 
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType? keyboardType;

  const ContractField({
    super.key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    return TextField(
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
          fontWeight: FontWeight.w600,
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