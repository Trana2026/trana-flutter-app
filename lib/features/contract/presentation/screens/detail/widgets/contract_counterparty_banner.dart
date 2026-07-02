import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/report_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/revision_request_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/report_detail_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/widgets/modals/revision_request_bottom_sheet.dart';

class ContractCounterpartyBanner extends HookConsumerWidget {
  const ContractCounterpartyBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createVM = ref.read(createContractViewModelProvider.notifier);
    final detailState = ref.watch(detailContractViewModelProvider);
    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    final revisionVM = ref.read(revisionRequestViewModelProvider.notifier);
    final reportVM = ref.read(reportContractViewModelProvider.notifier);

    final status = detailState.status;
    final isPending = useRef(false);

    return GestureDetector(
      onTap: () async {
        if (isPending.value) return;
        isPending.value = true;
        try {
          // 계약서 초안 상태 (계약서 수정하기)
          if (status == ContractStatus.ready) {
            final router = GoRouter.of(context);
            final success = await detailVM.revert();
            if (!success) {
              if (context.mounted) {
                final state = ref.read(detailContractViewModelProvider);
                showErrorToast(context, state.error!);
                detailVM.clearError();
              }
              return;
            }

            createVM.loadFromDraft(
              publicCode: detailState.publicCode,
              consentType: detailState.consentType,
              deliveryType: detailState.deliveryType,
              role: detailState.myRole,
              attachmentIds: detailState.attachmentIds,
              existingAttachmentUrls: detailState.attachmentImageUrls,
              tradingPlatform: detailState.tradingPlatform ?? '',
              title: detailState.title ?? '',
              price: detailState.price ?? 0,
              conditionSummary: detailState.conditionSummary ?? '',
              conditionDetails: detailState.conditionDetails ?? '',
              warrantyPeriodDays: detailState.warrantyPeriodDays,
            );

            router.push(AppRoutes.contractCreate);
            // 수정 요청 상태 (계약서 수정하기)
          } else if (status == ContractStatus.revisionRequested &&
              detailState.isCreator) {
            final success = await revisionVM.getLatestRevisionReason(
              detailState.publicCode,
            );
            if (!context.mounted) return;
            if (!success) {
              final state = ref.read(revisionRequestViewModelProvider);
              showErrorToast(context, state.error!);
              revisionVM.clearError();
              return;
            }

            // 바텀시트를 띄우기 전에 값 있는 필드를 selectedFields에 미리 추가
            final s = ref.read(revisionRequestViewModelProvider);
            final reasonByField = {
              '거래 방식': s.deliveryTypeReason,
              '거래 플랫폼': s.tradingPlatformReason,
              '거래 물품명': s.titleReason,
              '거래 금액': s.priceReason,
              '상품 상태': s.conditionSummaryReason,
              '상품 상세 설명': s.conditionDetailsReason,
            };
            revisionVM.updateSelectedFields({
              ...s.selectedFields,
              for (final e in reasonByField.entries)
                if (e.value.isNotEmpty) e.key,
            });

            if (!context.mounted) return;
            showModalBottomSheet<void>(
              context: context,
              barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (_) => RevisionRequestBottomSheet(),
            );
            // 신고 접수 상태
          } else if (status == ContractStatus.reported) {
            final success = await reportVM.readReport(detailState.publicCode);
            if (!context.mounted) return;
            if (!success) {
              final state = ref.read(reportContractViewModelProvider);
              showErrorToast(context, state.error!);
              reportVM.clearError();
              return;
            }

            showModalBottomSheet(
              context: context,
              barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (_) => ReportDetailBottomSheet(),
            );
          } else {
            return;
          }
        } finally {
          isPending.value = false;
        }
      },
      child: Container(
        width: double.infinity,
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
                color: status.bannerIconBgColor(context),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Icon(
                status.bannerIcon(detailState.isCreator),
                color: status.bannerIconColor(context),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (status
                      .bannerTopLabel(detailState.isCreator)
                      .isNotEmpty) ...[
                    Text(
                      status.bannerTopLabel(detailState.isCreator),
                      style: context.txt(
                        color: vrc(context).textTertiary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                  Text(
                    status.bannerBottomLabel(detailState.isCreator),
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
