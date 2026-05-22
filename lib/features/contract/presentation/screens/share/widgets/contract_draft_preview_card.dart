import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/utils/contract_text_builder.dart';
import 'package:trana/features/contract/presentation/viewmodels/contract_detail_view_model.dart';

class ContractDraftPreviewCard extends HookConsumerWidget {
  const ContractDraftPreviewCard({super.key});

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
        color: fxc(context).subtitleBlue,
        borderRadius: BorderRadius.circular(18),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.text_snippet,
                  size: 24,
                  color: fxc(context).textInfo,
                ),
                const SizedBox(width: 8),
                Text(
                  '자동 생성된 계약서',
                  style: TextStyle(
                    color: fxc(context).textInfo,
                    fontSize: 16,
                    fontFamily: 'PretendardBold',
                    height: 1.5,
                    letterSpacing: 0.16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            ...contents.indexed.map((
              (int, ({String title, String body})) entry,
            ) {
              final (i, c) = entry;
              final body = c.body.replaceAll('\n', ' ');

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    '${c.title} $body',
                    style: TextStyle(
                      color: fxc(context).textInfo,
                      fontSize: 12,
                      fontFamily: 'PretendardMedium',
                      height: 1.5,
                      letterSpacing: 0.16,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
