import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/contract_detail_page/widgets/contract_summary_card.dart';

class ContractDetailHeader extends HookConsumerWidget {
  final Color statusColor;
  final String statusLabel;
  final IconData statusIcon;

  const ContractDetailHeader({
    super.key,
    required this.statusColor,
    required this.statusLabel,
    required this.statusIcon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 125,
          color: statusColor,
          padding: const EdgeInsets.fromLTRB(18, 15, 18, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "현재 상태",
                      style: TextStyle(
                        color: fxc(context).textBrand,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      statusLabel,
                      style: TextStyle(
                        color: fxc(context).textBrand,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.28),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  statusIcon,
                  color: fxc(context).textBrand,
                  size: 26,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 18,
          right: 18,
          top: 85,
          child: const ContractSummaryCard(), // const 추가 가능 여부 확인
        ),
      ],
    );
  }
}
