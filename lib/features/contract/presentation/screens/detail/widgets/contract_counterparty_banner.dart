import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_bottom_sheet.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/create_page_mode.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/presentation/viewmodels/cancel_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/report_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/revision_request_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/contract_cancel_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/widgets/modals/report_detail_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/widgets/modals/revision_request_bottom_sheet.dart';

class ContractCounterpartyBanner extends HookConsumerWidget {
  const ContractCounterpartyBanner({super.key, required this.isPending});

  final ValueNotifier<bool> isPending;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (status, isCreator) = ref.watch(
      detailContractViewModelProvider.select((s) => (s.status, s.isCreator)),
    );

    return GestureDetector(
      onTap: () async {
        if (isPending.value) return;
        isPending.value = true;
        try {
          // 콜백 내부에서만 쓰이는 필드는 탭 시점에 최신값을 읽음
          final detailState = ref.read(detailContractViewModelProvider);

          // 1. 계약서 초안 상태 (계약서 수정하기)
          if (status == ContractStatus.ready) {
            final createVM = ref.read(createContractViewModelProvider.notifier);
            createVM.setCreatePageMode(CreatePageMode.editMode);

            createVM.loadFromDraft(
              publicCode: detailState.publicCode,
              deliveryType: detailState.deliveryType,
              role: detailState.myRole,
              attachmentIds: detailState.attachmentIds,
              existingAttachmentUrls: detailState.attachmentImageUrls,
              tradingPlatform: detailState.tradingPlatform,
              title: detailState.title,
              price: detailState.price,
              conditionSummary: detailState.conditionSummary,
              conditionDetails: detailState.conditionDetails,
              warrantyPeriodDays: detailState.warrantyPeriodDays,
            );

            if (!context.mounted) return;
            context.push(AppRoutes.contractCreate);
            // 2. 수정 요청 상태 (계약서 수정하기)
          } else if (status == ContractStatus.revisionRequested) {
            // 최신 수정 요청 내용 불러오기
            final revisionVM = ref.read(
              revisionRequestViewModelProvider.notifier,
            );
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
            showCustomBottomSheet<void>(
              context,
              const RevisionRequestBottomSheet(),
            );
            // 3. 신고 접수 상태
          } else if (status == ContractStatus.reported) {
            //  최근 신고 내용 조회
            final reportVM = ref.read(reportContractViewModelProvider.notifier);
            final success = await reportVM.readReport(detailState.publicCode);
            if (!context.mounted) return;
            if (!success) {
              final state = ref.read(reportContractViewModelProvider);
              showErrorToast(context, state.error!);
              reportVM.clearError();
              return;
            }

            showCustomBottomSheet(context, const ReportDetailBottomSheet());
            // 4. 취소 요청 상태
          } else if (status == ContractStatus.cancelRequested) {
            // 취소 요청 내용 조회
            final cancelVM = ref.read(cancelContractViewModelProvider.notifier);
            final success = await cancelVM.readCancel(detailState.publicCode);
            if (!context.mounted) return;
            if (!success) {
              final state = ref.read(cancelContractViewModelProvider);
              showErrorToast(context, state.error!);
              cancelVM.clearError();
              return;
            }

            showCustomBottomSheet(context, const ContractCancelBottomSheet());
            // 5. 그 외 X
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
              child: status
                  .bannerIcon(isCreator)
                  .copyWith(color: status.bannerIconColor(context)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (status.bannerTopLabel(isCreator).isNotEmpty) ...[
                    Text(
                      status.bannerTopLabel(isCreator),
                      style: context.txt(
                        color: vrc(context).textTertiary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                  Text(
                    status.bannerBottomLabel(isCreator),
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
