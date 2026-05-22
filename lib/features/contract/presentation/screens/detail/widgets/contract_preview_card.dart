import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/utils/contract_text_builder.dart';
import 'package:trana/features/contract/presentation/viewmodels/contract_detail_view_model.dart';

class ContractPreviewCard extends HookConsumerWidget {
  const ContractPreviewCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(contractDetailViewModelProvider);

    final contract = detailState.selectedContract!;
    final contents = buildContractContents(
      productName: contract.productName,
      amount: contract.amount,
      transactionMethod: contract.transactionMethod,
    );

    return Container(
      width: double.infinity,
      height: 215,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: vrc(context).borderSecondary!),
      ),
      child: ListView.separated(
        itemCount: contents.length,
        separatorBuilder: (_, _) => const SizedBox(height: 14),
        itemBuilder: (_, i) =>
            _clause(context, title: contents[i].title, body: contents[i].body),
      ),
    );
  }

  Widget _clause(
    BuildContext context, {
    required String title,
    required String body,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          body,
          style: TextStyle(
            color: vrc(context).textTertiary,
            fontSize: 11.5,
            fontWeight: FontWeight.w600,
            height: 1.35,
          ),
        ),
      ],
    );
  }
}
