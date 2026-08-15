import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/core/widgets/select_role_card.dart';
import 'package:trana/features/contract/domain/enums/create_page_mode.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';

class SelectUserRolePage extends HookConsumerWidget {
  const SelectUserRolePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publicCode = ref.read(createContractViewModelProvider).publicCode;
    final selectedIndex = useState<int?>(null);
    final isEnabled = selectedIndex.value != null;
    final isPending = useState(false);

    const int currentStep = 1;
    const int totalStep = 3;
    final double progress = currentStep / totalStep;

    return PendingOverlay(
      isPending: isPending.value,
      child: Scaffold(
        backgroundColor: vrc(context).background,
        appBar: CustomAppBar.leading(
          title: "계약 작성",
          onTapLeading: () => context.go(AppRoutes.home),
          bottomProgress: progress,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "역할 선택",
                  style: context.txt(
                    color: vrc(context).textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "역할을 선택해주세요.\n선택한 역할에 따라 계약 조건이 자동으로 설정됩니다.",
                  style: context.txt(),
                ),
                const SizedBox(height: 20),

                SelectRoleCard(
                  appIcon: AppIcon.svg(asset: 'assets/icons/box.svg'),
                  title: "저는 판매자입니다",
                  description: "물품을 전달하고 대금을 지급받아요",
                  isSelected: selectedIndex.value == 0,
                  onTap: () => selectedIndex.value = 0,
                ),
                const SizedBox(height: 10),
                SelectRoleCard(
                  appIcon: AppIcon.data(icon: CooliconsIcon.user01),
                  title: "저는 구매자입니다",
                  description: "물품을 전달받고 대금을 지급해요",
                  isSelected: selectedIndex.value == 1,
                  onTap: () => selectedIndex.value = 1,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: PrimaryButton.brand(
              text: "다음",
              disabled: !isEnabled,
              onTap: () async {
                if (isPending.value) return;
                isPending.value = true;
                try {
                  final createVM = ref.read(
                    createContractViewModelProvider.notifier,
                  );
                  createVM.setCreatePageMode(CreatePageMode.createMode);

                  // 계약 생성
                  if (publicCode == null) {
                    final success = await createVM.createDraft();
                    if (!context.mounted) return;
                    if (!success) {
                      final state = ref.read(createContractViewModelProvider);
                      showErrorToast(context, state.error!);
                      createVM.clearError();
                      return;
                    }
                  }

                  createVM.updateRole(selectedIndex.value);

                  // Draft 역할 업데이트
                  final success = await createVM.updateDraftRole();
                  if (!context.mounted) return;
                  if (!success) {
                    final state = ref.read(createContractViewModelProvider);
                    showErrorToast(context, state.error!);
                    createVM.clearError();
                    return;
                  }

                  // EVT-014: contract_role_selected
                  AnalyticsService.track(
                    'contract_role_selected',
                    properties: {
                      'contract_party_role': selectedIndex.value == 0
                          ? 'seller'
                          : 'buyer',
                      'entry_point': 'select_role',
                    },
                  );

                  context.push(AppRoutes.contractCreate);
                } finally {
                  if (context.mounted) isPending.value = false;
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
