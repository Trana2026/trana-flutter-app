import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/contract_card.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

class ContractRequestListPage extends HookConsumerWidget {
  const ContractRequestListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeContractViewModelProvider);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "목록",
        onTapLeading: () => context.pop(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: homeState.requestedContracts.length,
        itemBuilder: (_, i) => ContractCard(c: homeState.requestedContracts[i]),
      ),
    );
  }
}
