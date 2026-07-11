import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/app_icon.dart';

class HomeSearchBar extends HookConsumerWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();

    return SizedBox(
      height: 45,
      child: TextField(
        controller: searchController,
        style: context.txt(color: vrc(context).textPrimary),
        cursorColor: vrc(context).textPrimary,
        decoration: InputDecoration(
          prefixIconConstraints: const BoxConstraints.tightFor(width: 38),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: AppIcon.svg(
              asset: 'assets/icons/search.svg',
              color: vrc(context).iconDisable!,
            ),
          ),
          hintText: "물품명, 거래자, ID 검색...",
          hintStyle: context.txt(color: vrc(context).textDisable),
          filled: true,
          fillColor: vrc(context).secondaryColor,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
