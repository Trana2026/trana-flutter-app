import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/presentation/viewmodels/cancel_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/report_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/revision_request_view_model.dart';

class ContractDetailHeader extends HookConsumerWidget {
  const ContractDetailHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (status, isCreator) = ref.watch(
      detailContractViewModelProvider.select(
        (s) => (s.status, s.isCreator),
      ),
    );
    final isMyCancel = ref.watch(
      cancelContractViewModelProvider.select((s) => s.recentCancelIsMine),
    );
    final isMyReport = ref.watch(
      reportContractViewModelProvider.select((s) => s.recentReportIsMine),
    );
    final revisionDone = ref.watch(
      revisionRequestViewModelProvider.select((s) => s.revisionDone),
    );

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "현재 상태",
                    style: context.txt(
                      color: vrc(context).textTertiary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status.statusLabel(
                      isCreator: isCreator,
                      isMyCancel: isMyCancel,
                      isMyReport: isMyReport,
                      revisionDone: revisionDone,
                    ),
                    style: context.txt(
                      color: status.statusColor(context),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: status.bgColor(context),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                status.statusIcon(),
                color: status.statusColor(context),
                size: 32,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
