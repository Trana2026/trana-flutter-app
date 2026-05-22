import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_kv.dart';

class ContractSummaryCard extends HookConsumerWidget {
  final String itemName;
  final String price;
  final String roleLabel;

  const ContractSummaryCard({
    super.key,
    required this.itemName,
    required this.price,
    required this.roleLabel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: const BoxConstraints(minHeight: 172),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Expanded(
                child: ContractKv(
                  label: "물품명",
                  value: itemName,
                  alignEnd: false,
                ),
              ),
              Expanded(
                child: ContractKv(
                  label: "거래 금액",
                  value: "$price원",
                  alignEnd: true,
                ),
              ),
            ],
          ),
          Divider(color: vrc(context).tertiaryColor),
          Row(
            children: [
              const Expanded(
                child: ContractKv(
                  label: "거래 방식",
                  value: "택배 거래",
                  alignEnd: false,
                ),
              ),
              Expanded(
                child: ContractKv(
                  label: "내 역할",
                  value: '$roleLabel자',
                  alignEnd: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
