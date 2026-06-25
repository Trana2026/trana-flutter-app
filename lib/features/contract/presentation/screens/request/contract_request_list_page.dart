import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/contract_card.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

class ContractRequestListPage extends HookConsumerWidget {
  const ContractRequestListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeContractViewModelProvider);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        backgroundColor: vrc(context).background,
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(
            CooliconsIcon.chevronLeft,
            color: vrc(context).iconPrimary,
            size: 24,
          ),
        ),
        title: Text(
          "목록",
          style: context.txt(
            color: vrc(context).textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: homeState.requests.length,
        itemBuilder: (_, index) => ContractCard(c: homeState.requests[index]),
      ),
    );
  }
}
