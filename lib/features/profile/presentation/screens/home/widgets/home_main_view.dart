import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
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
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/notification/presentation/viewmodels/notification_view_model.dart';
import 'package:trana/features/profile/presentation/providers/banner_occupied_height_provider.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_contract_type_selector.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_empty_state.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_filter_button.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_filter_chip_list.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_search_bar.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

class HomeMainView extends HookConsumerWidget {
  const HomeMainView({super.key, required this.isPending});

  final ValueNotifier<bool> isPending;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (filteredContracts, isLoadingMyContracts) = ref.watch(
      homeContractViewModelProvider.select(
        (s) => (s.filteredContracts, s.isLoadingMyContracts),
      ),
    );
    final hasUnreadNotis = ref.watch(
      notificationViewModelProvider.select((s) => s.unreadNotis.isNotEmpty),
    );
    final isFilterExpanded = useState(false);
    final typeIndex = useState(0);

    final contracts = switch (typeIndex.value) {
      1 => filteredContracts.where((c) => c.isCreator).toList(),
      2 => filteredContracts.where((c) => !c.isCreator).toList(),
      _ => filteredContracts,
    };

    // 배너(+토스트)가 떠 있는 동안, 계약서 목록을 그 위까지 스크롤 되게 하기 위한 하단 오프셋
    final bannerAvoidanceBottom = ref.watch(bannerOccupiedHeightProvider);

    return Container(
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
                      child: Stack(
                        children: [
                          Center(
                            child: Icon(
                              CooliconsIcon.bell,
                              color: vrc(context).iconPrimary,
                              size: 20,
                            ),
                          ),
                          if (hasUnreadNotis)
                            Positioned(
                              top: 15,
                              right: 15,
                              child: Container(
                                height: 4,
                                width: 4,
                                decoration: BoxDecoration(
                                  color: fxc(context).statusError,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                        ],
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
              decoration: BoxDecoration(
                color: vrc(context).background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SafeArea(
                top: false,
                // pull-to-refresh
                child: CustomRefreshIndicator(
                  offsetToArmed: 120,
                  builder: (context, child, controller) => child,
                  onRefresh: () async {
                    // 사용자의 계약 전체 목록 불러오기
                    final homeVM = ref.read(
                      homeContractViewModelProvider.notifier,
                    );
                    final success = await homeVM.readMyContracts();
                    if (!context.mounted) return;
                    if (!success) {
                      final state = ref.read(homeContractViewModelProvider);
                      showErrorToast(context, state.error!);
                      homeVM.clearError();
                    }
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: bannerAvoidanceBottom,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text("나의 계약", style: context.txt()),
                                const Spacer(),
                                HomeContractTypeSelector(
                                  selectedIndex: typeIndex.value,
                                  onSelect: (i) => typeIndex.value = i,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 28),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
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
                          ),

                          if (isFilterExpanded.value) ...[
                            const SizedBox(height: 8),
                            const HomeFilterChipList(),
                          ],
                          const SizedBox(height: 16),

                          isLoadingMyContracts
                              ? const SizedBox(
                                  height: 200,
                                  child: CustomLoadingBar(),
                                )
                              : contracts.isEmpty
                              ? const HomeEmptyState()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  itemCount: contracts.length,
                                  itemBuilder: (_, i) => ContractCard(
                                    c: contracts[i],
                                    isPending: isPending,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
