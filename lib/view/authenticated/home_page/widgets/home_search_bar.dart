import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';

class HomeSearchBar extends HookConsumerWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();

    return SizedBox(
      height: 56,
      child: TextField(
        controller: searchController,
        style: TextStyle(
          color: vrc(context).textPrimary,
          fontSize: 15,
          fontFamily: "PretendardMedium"
        ),
        cursorColor: fxc(context).brandColor,
        decoration: InputDecoration(
          hintText: "물품명, 거래자, ID 검색...",
          hintStyle: TextStyle(
            color: vrc(context).textDisable,
            fontSize: 15,
            fontFamily: "PretendardMedium"
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Icon(
              Icons.search,
              color: vrc(context).textDisable,
              size: 30,
            ),
          ),
          filled: true,
          fillColor: vrc(context).secondaryColor,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}