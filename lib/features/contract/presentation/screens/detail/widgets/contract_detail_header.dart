import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_summary_card.dart';

class ContractDetailHeader extends HookConsumerWidget {
  final Color statusColor;
  final String statusLabel;
  final IconData statusIcon;
  final String itemName;
  final String price;
  final String roleLabel;

  const ContractDetailHeader({
    super.key,
    required this.statusColor,
    required this.statusLabel,
    required this.statusIcon,
    required this.itemName,
    required this.price,
    required this.roleLabel,
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
                        fontSize: 14,
                        fontFamily: "PretendardBold",
                        letterSpacing: -0.2
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      statusLabel,
                      style: TextStyle(
                        color: fxc(context).textBrand,
                        fontSize: 22,
                        fontFamily: "PretendardExtraBold",
                        letterSpacing: -0.2
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
          child: ContractSummaryCard(
            itemName: itemName,
            price: price,
            roleLabel: roleLabel,
          ),
        ),
      ],
    );
  }
}
