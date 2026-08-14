import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/widgets/counter_party_info.dart';
import 'package:trana/features/profile/presentation/viewmodels/block_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

class BlockBottomSheet extends HookConsumerWidget {
  const BlockBottomSheet({super.key, required this.publicCode});

  final String publicCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPending = useState(false);

    return PopScope(
      canPop: !isPending.value,
      child: PendingOverlay(
        isPending: isPending.value,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          decoration: BoxDecoration(
            color: vrc(context).background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 145,
                    height: 4,
                    decoration: BoxDecoration(
                      color: vrc(context).disableColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                const CounterPartyInfo(),
                const SizedBox(height: 20),

                PrimaryButton.brand(
                  text: "상대방 차단하기",
                  onTap: () async {
                    if (isPending.value) return;
                    isPending.value = true;
                    try {
                      // 계약 상대방 차단
                      final blockVM = ref.read(blockViewModelProvider.notifier);
                      final success = await blockVM.blockContractCounterpart(
                        publicCode,
                      );
                      if (!context.mounted) return;
                      if (!success) {
                        final state = ref.read(blockViewModelProvider);
                        showErrorToast(context, state.error!);
                        blockVM.clearError();
                        return;
                      }

                      context.pop();

                      // 홈 목록 갱신
                      final homeContractVM = ref.read(
                        homeContractViewModelProvider.notifier,
                      );
                      await homeContractVM.readMyContracts();
                    } finally {
                      if (context.mounted) isPending.value = false;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
