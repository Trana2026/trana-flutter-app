import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/utils/string_extensions.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/domain/entities/contract_entity.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/presentation/viewmodels/cancel_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/report_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/revision_request_view_model.dart';

class ContractCard extends HookConsumerWidget {
  const ContractCard({super.key, required this.c});

  final ContractEntity c;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    final reportVM = ref.read(reportContractViewModelProvider.notifier);
    final cancelVM = ref.read(cancelContractViewModelProvider.notifier);
    final revisionState = ref.watch(revisionRequestViewModelProvider);

    final isPending = useRef(false);

    return GestureDetector(
      onTap: () async {
        if (isPending.value) return;
        isPending.value = true;
        try {
          final results = await Future.wait([
            detailVM.loadDetail(c.publicCode),
            reportVM.readReport(c.publicCode),
            cancelVM.readCancel(c.publicCode),
          ]);

          if (!context.mounted) return;

          if (!results[0]) {
            final state = ref.read(detailContractViewModelProvider);
            showErrorToast(context, state.error!);
            detailVM.clearError();
            return;
          } else if (!results[1]) {
            final state = ref.read(reportContractViewModelProvider);
            showErrorToast(context, state.error!);
            reportVM.clearError();
            return;
          } else if (!results[2]) {
            final state = ref.read(cancelContractViewModelProvider);
            showErrorToast(context, state.error!);
            cancelVM.clearError();
            return;
          }

          if (c.status == ContractStatus.inProgress ||
              c.status == ContractStatus.draft) {
            context.push(AppRoutes.contractDetail);
          } else {
            context.push(AppRoutes.biometricLock);
          }
        } finally {
          isPending.value = false;
        }
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: vrc(context).secondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: c.firstAttachmentUrl != null
                      ? Image.network(
                          c.firstAttachmentUrl!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => placeholder(context),
                        )
                      : placeholder(context),
                ),
                if (c.attachmentCount > 0)
                  Positioned(
                    bottom: 6,
                    right: 6,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: fxc(context).imageCountBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${c.attachmentCount}',
                        style: context.txt(
                          color: fxc(context).textBrand,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      c.title ?? '-',
                      style: context.txt(
                        color: vrc(context).textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      c.price != null
                          ? '${(c.price).toString().toPriceFormat}원'
                          : '-',
                      style: context.txt(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: vrc(context).background,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                CooliconsIcon.user01,
                                size: 16,
                                color: vrc(context).textSecondary,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                c.myRole != null ? '${c.myRole?.label}자' : '',
                                style: context.txt(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: c.status.bgColor(context),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            c.status.statusLabel(
                              isCreator: c.isCreator,
                              isMyCancel: c.cancelIsMine ?? false,
                              revisionDone: revisionState.revisionDone,
                            ),
                            style: context.txt(
                              color: c.status.statusColor(context),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget placeholder(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: vrc(context).tertiaryColor,
      child: Icon(
        CooliconsIcon.image02,
        color: vrc(context).textDisable,
        size: 32,
      ),
    );
  }
}
