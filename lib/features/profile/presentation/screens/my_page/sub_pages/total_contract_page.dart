import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/contract_card.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/empty_contract_view.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

class TotalContractPage extends HookConsumerWidget {
  const TotalContractPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeContractViewModelProvider);

    final isPending = useState(false);

    return PendingOverlay(
      isPending: isPending.value,
      child: Scaffold(
        backgroundColor: vrc(context).background,
        appBar: CustomAppBar.leading(
          title: "총 계약 내역",
          onTapLeading: () => context.pop(),
        ),
        body: homeState.myContracts.isEmpty
            ? EmptyContractView(emptyText: "생성된 계약이 없어요")
            : Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: homeState.myContracts.length,
                  itemBuilder: (_, i) => ContractCard(
                    c: homeState.myContracts[i],
                    isPending: isPending,
                  ),
                ),
              ),
      ),
    );
  }
}
