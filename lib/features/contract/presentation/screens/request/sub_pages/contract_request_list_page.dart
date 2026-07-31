import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/contract_card.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

class ContractRequestListPage extends HookConsumerWidget {
  const ContractRequestListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestedContracts = ref.watch(
      homeContractViewModelProvider.select((s) => s.requestedContracts),
    );
    final isPending = useState(false);

    return PendingOverlay(
      isPending: isPending.value,
      child: Scaffold(
        backgroundColor: vrc(context).background,
        appBar: CustomAppBar.leading(
          title: "목록",
          onTapLeading: () => context.pop(),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: requestedContracts.length,
          itemBuilder: (_, i) =>
              ContractCard(c: requestedContracts[i], isPending: isPending),
        ),
      ),
    );
  }
}
