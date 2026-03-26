import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';

class ContractCounterpartyBanner extends HookConsumerWidget {
  final Color iconBgColor;
  final Widget iconWidget;
  final String topLabel;
  final String bottomLabel;
  final bool showChevron;

  const ContractCounterpartyBanner({
    super.key,
    required this.iconBgColor,
    required this.iconWidget,
    required this.topLabel,
    required this.bottomLabel,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 77,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: iconWidget),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  topLabel,
                  style: TextStyle(
                    color: vrc(context).textTertiary,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  bottomLabel,
                  style: TextStyle(
                    color: vrc(context).textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          if (showChevron)
            Icon(
              Icons.chevron_right_rounded,
              color: vrc(context).iconSecondary,
              size: 26,
            ),
        ],
      ),
    );
  }
}
