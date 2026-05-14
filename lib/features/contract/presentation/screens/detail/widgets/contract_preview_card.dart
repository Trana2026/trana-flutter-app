import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';

class ContractPreviewCard extends HookConsumerWidget {
  final String itemName;
  final String price;

  const ContractPreviewCard({
    super.key,
    required this.itemName,
    required this.price,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 215,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: vrc(context).borderSecondary!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _clause(
            context,
            title: "제 1조 [목적]",
            content: "본 계약은 판매자와 구매자 간의 '$itemName' 거래에 관한 제반 사항을 규정함을 목적으로 한다.",
          ),
          const SizedBox(height: 14),
          _clause(
            context,
            title: "제 2조 [대금 지급]",
            content: "총 거래 금액 $price원을 물품 인도와 동시에 지급한다.",
          ),
          const SizedBox(height: 14),
          _clause(
            context,
            title: "제 3조 [거래 조건]",
            content: "판매자는 물품 수령일로부터 7일간 하자에 대한 책임을 진다.",
          ),
        ],
      ),
    );
  }

  Widget _clause(
    BuildContext context, {
    required String title,
    required String content,
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
          content,
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
