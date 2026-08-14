import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';

class CounterPartyInfo extends HookConsumerWidget {
  const CounterPartyInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (
      counterpartyTrustScore,
      counterpartyVerified,
      counterpartyTradeCount,
      counterpartyDisputeCount,
      counterpartyConfirmedReportCount,
    ) = ref.watch(
      detailContractViewModelProvider.select(
        (s) => (
          s.counterpartyTrustScore,
          s.counterpartyVerified,
          s.counterpartyTradeCount,
          s.counterpartyDisputeCount,
          s.counterpartyConfirmedReportCount,
        ),
      ),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: vrc(context).tertiaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: AppIcon.data(
                  icon: CooliconsIcon.user02,
                  size: 18,
                  color: vrc(context).iconSecondary,
                ),
              ),
              const SizedBox(width: 7),
              Text(
                "거래 상대방",
                style: context.txt(
                  color: vrc(context).textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: fxc(context).opacitySuccess,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "$counterpartyTrustScore점",
                  style: context.txt(
                    color: fxc(context).brandColor,
                    fontSize: 10,
                  ),
                ),
              ),
              const Spacer(),
              AppIcon.svg(
                asset:
                    "assets/icons/${counterpartyVerified ? 'shield_check' : 'shield'}.svg",
                size: 16,
                color: counterpartyVerified
                    ? fxc(context).brandColor
                    : vrc(context).tertiaryColor,
              ),
              const SizedBox(width: 2),
              Text(
                "본인 확인 ${counterpartyVerified ? '완료' : '미완료'}",
                style: context.txt(
                  color: fxc(context).brandColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              contractCount(
                context,
                label: '거래',
                count: counterpartyTradeCount,
              ),
              contractCount(
                context,
                label: '분쟁',
                count: counterpartyDisputeCount,
              ),
              contractCount(
                context,
                label: '확인된 신고',
                count: counterpartyConfirmedReportCount,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget contractCount(
    BuildContext context, {
    required String label,
    required int count,
  }) {
    return Row(
      children: [
        Text(
          label,
          style: context.txt(color: vrc(context).textTertiary, fontSize: 12),
        ),
        const SizedBox(width: 4),
        Text(
          "$count건",
          style: context.txt(
            color: vrc(context).textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
