import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_bottom_sheet.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/thumbnail_placeholder.dart';
import 'package:trana/features/contract/domain/entities/contract_entity.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/utils/string_extensions.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/presentation/viewmodels/cancel_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/report_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/revision_request_view_model.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/modals/block_bottom_sheet.dart';

class ContractCard extends HookConsumerWidget {
  const ContractCard({
    super.key,
    required this.c,
    required this.isPending,
    this.entryPoint = 'contract_list',
  });

  final ContractEntity c;
  final ValueNotifier<bool> isPending;

  /// EVT-011(contract_opened) entry_point 속성 — 이 카드가 렌더링된 화면을 식별
  final String entryPoint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final revisionDone = ref.watch(
      revisionRequestViewModelProvider.select((s) => s.revisionDone),
    );

    // 계약 상대방 차단 가능 여부 (계약 수신자이면서 계약이 양측 서명 완료 이전 상태)
    final bool canBlock =
        !c.isCreator &&
        (c.status != ContractStatus.signed &&
            c.status != ContractStatus.completed &&
            c.status != ContractStatus.reported);

    return GestureDetector(
      onTap: () async {
        if (isPending.value) return;
        isPending.value = true;
        try {
          final detailVM = ref.read(detailContractViewModelProvider.notifier);
          final reportVM = ref.read(reportContractViewModelProvider.notifier);
          final cancelVM = ref.read(cancelContractViewModelProvider.notifier);

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

          // EVT-011: contract_opened (GA4 권장 이벤트명 select_content로 매핑)
          AnalyticsService.track(
            'contract_opened',
            ga4EventName: 'select_content',
            properties: {
              'contract_id': c.publicCode,
              'contract_status': c.status.name,
              'entry_point': entryPoint,
              if (c.myRole != null) 'actor_role': c.myRole!.name,
            },
          );

          if (c.status == ContractStatus.inProgress ||
              c.status == ContractStatus.draft) {
            context.push(AppRoutes.contractDetail);
          } else {
            context.push(AppRoutes.biometricLock);
          }
        } finally {
          if (context.mounted) isPending.value = false;
        }
      },
      child: Stack(
        children: [
          Container(
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
                    c.firstAttachmentUrl == null
                        ? const ThumbnailPlaceholder()
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              imageUrl: c.firstAttachmentUrl!,
                              cacheKey: '${c.publicCode}-first',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              errorWidget: (_, _, _) =>
                                  const ThumbnailPlaceholder(),
                            ),
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
                        Padding(
                          padding: EdgeInsets.only(right: 30), // 차단 버튼 영역
                          child: Text(
                            c.title ?? '-',
                            style: context.txt(
                              color: vrc(context).textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
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
                                    c.myRole != null
                                        ? '${c.myRole?.label}자'
                                        : '',
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
                                  isMyReport: c.reportIsMine ?? false,
                                  revisionDone: revisionDone,
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

          // 차단 버튼
          if (canBlock)
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () async {
                  if (isPending.value) return;
                  isPending.value = true;
                  try {
                    // 계약 상세 정보 불러오기 (거래 상대방 정보)
                    final detailVM = ref.read(
                      detailContractViewModelProvider.notifier,
                    );
                    final success = await detailVM.loadDetail(c.publicCode);
                    if (!context.mounted) return;
                    if (!success) {
                      final state = ref.read(detailContractViewModelProvider);
                      showErrorToast(context, state.error!);
                      detailVM.clearError();
                      return;
                    }
                  } finally {
                    if (context.mounted) isPending.value = false;
                  }

                  showCustomBottomSheet(
                    context,
                    BlockBottomSheet(publicCode: c.publicCode),
                  );
                },
                child: SizedBox(
                  height: 35,
                  width: 45,
                  child: Center(
                    child: Text(
                      "•••",
                      style: context.txt(
                        color: vrc(context).textPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
