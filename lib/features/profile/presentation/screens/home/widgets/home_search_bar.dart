import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

class HomeSearchBar extends HookConsumerWidget {
  const HomeSearchBar({super.key});

  static const _debounceDuration = Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    final initialQuery = ref.read(homeContractViewModelProvider).searchQuery;

    final searchController = useTextEditingController(text: initialQuery);
    final debounceTimer = useRef<Timer?>(null);

    useEffect(() {
      return () => debounceTimer.value?.cancel();
    }, []);

    return SizedBox(
      height: 45,
      child: TextField(
        controller: searchController,
        onChanged: (value) {
          debounceTimer.value?.cancel();
          debounceTimer.value = Timer(_debounceDuration, () {
            homeVM.applyQuery(value);
          });
        },
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
          hintText: "물품명 검색...",
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
