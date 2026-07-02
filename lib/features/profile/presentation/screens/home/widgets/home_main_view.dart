import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';
import 'package:trana/core/widgets/contract_card.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_contract_type_selector.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_empty_state.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_filter_button.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_filter_chip_list.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_search_bar.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

class HomeMainView extends HookConsumerWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeContractViewModelProvider);
    final isFilterExpanded = useState(false);
    final typeIndex = useState(0);

    final contracts = switch (typeIndex.value) {
      1 => homeState.myContracts.where((c) => c.isCreator).toList(),
      2 => homeState.myContracts.where((c) => !c.isCreator).toList(),
      _ => homeState.myContracts,
    };

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: vrc(context).secondaryColor,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              decoration: BoxDecoration(
                color: vrc(context).background,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "내 계약서",
                          style: context.txt(
                            color: vrc(context).textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        Text("거래 내역 관리", style: context.txt()),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => context.push(AppRoutes.notification),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: vrc(context).secondaryColor,
                        ),
                        child: Center(
                          child: Icon(
                            CooliconsIcon.bell,
                            color: vrc(context).iconPrimary,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  color: vrc(context).background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SafeArea(
                  top: false,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("나의 계약", style: context.txt()),
                            const Spacer(),
                            HomeContractTypeSelector(
                              selectedIndex: typeIndex.value,
                              onSelect: (i) => typeIndex.value = i,
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Row(
                          children: [
                            Expanded(child: const HomeSearchBar()),
                            const SizedBox(width: 7),
                            HomeFilterButton(
                              isActive: isFilterExpanded.value,
                              onToggle: () => isFilterExpanded.value =
                                  !isFilterExpanded.value,
                            ),
                          ],
                        ),
                        if (isFilterExpanded.value) ...[
                          const SizedBox(height: 8),
                          const HomeFilterChipList(),
                        ],
                        const SizedBox(height: 16),
                        homeState.isLoading
                            ? const SizedBox(
                                height: 200,
                                child: CustomLoadingBar(),
                              )
                            : contracts.isEmpty
                            ? const HomeEmptyState()
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: contracts.length,
                                itemBuilder: (_, index) =>
                                    ContractCard(c: contracts[index]),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
