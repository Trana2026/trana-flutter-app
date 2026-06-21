import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';

class ContractCounterpartyBanner extends HookConsumerWidget {
  const ContractCounterpartyBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);

    final status = detailState.status;

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 77,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: vrc(context).secondaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: status.statusColor(context),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Icon(
                status.bannerIcon(),
                color: fxc(context).textBrand,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (status.bannerTopLabel().isNotEmpty) ...[
                    Text(
                      status.bannerTopLabel(),
                      style: context.txt(
                        color: vrc(context).textTertiary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                  Text(
                    status.bannerBottomLabel(),
                    style: context.txt(
                      color: vrc(context).textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (status.bannerShowChevron())
              Icon(
                CooliconsIcon.chevronRight,
                color: vrc(context).iconSecondary,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
