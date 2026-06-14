import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/utils/contract_text_builder.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';

class ContractPreviewCard extends HookConsumerWidget {
  const ContractPreviewCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);

    final contents = buildContractContents(
      productName: detailState.title!,
      amount: detailState.price!,
      transactionMethod: detailState.deliveryType!,
      platform: detailState.tradingPlatform!,
      conditionSummary: detailState.conditionSummary!,
      conditionDetails: detailState.conditionDetails!,
      isWarranted: true, // TODO : 백엔드 구현되면 반영
      // detailState.isWarranted
    );

    return Container(
      width: double.infinity,
      height: 215,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListView.separated(
        itemCount: contents.length,
        separatorBuilder: (_, _) => const SizedBox(height: 16),
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
          style: context.txt(
            color: vrc(context).textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          body,
          style: context.txt(color: vrc(context).textTertiary, fontSize: 12),
        ),
      ],
    );
  }
}
