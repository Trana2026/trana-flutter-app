import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/contract_detail_page/widgets/contract_kv.dart';

class ContractSummaryCard extends HookConsumerWidget {
  const ContractSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 172,
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
              const Expanded(
                child: ContractKv(
                  label: "물품명",
                  value: "MacBook Air M2",
                  alignEnd: false,
                ),
              ),
              const Expanded(
                child: ContractKv(
                  label: "거래 금액",
                  value: "1,200,000원",
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
              const Expanded(
                child: ContractKv(label: "내 역할", value: "판매자", alignEnd: false),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
