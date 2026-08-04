import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/utils/string_extensions.dart';
import 'package:trana/features/contract/presentation/viewmodels/ai_auto_fill_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';

class CostNoticeBottomSheet extends HookConsumerWidget {
  const CostNoticeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(
      detailContractViewModelProvider.select((s) => s.status),
    );
    final CreateContractState(
      :tradingPlatform,
      :title,
      :price,
      :cost,
      :isEditMode,
    ) = ref.read(
      createContractViewModelProvider,
    );
    final isPending = useState(false);

    useEffect(() {
      // modal_viewed: 계약 생성 비용 고지 바텀시트
      AnalyticsService.trackScreenView(
        'cost_notice_modal',
        entryPoint: 'contract_create_form',
      );
      return null;
    }, const []);

    return PendingOverlay(
      isPending: isPending.value,
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        decoration: BoxDecoration(
          color: vrc(context).background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 145,
                  height: 4,
                  decoration: BoxDecoration(
                    color: vrc(context).disableColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _NoticeItem(label: "거래 플랫폼", desc: tradingPlatform),
                    const SizedBox(height: 16),
                    _NoticeItem(label: "거래 물품명", desc: title),
                    const SizedBox(height: 16),
                    _NoticeItem(
                      label: "거래 금액",
                      desc: "${price.toString().toPriceFormat}원",
                    ),
                  ],
                ),
              ),

              Container(height: 8, color: vrc(context).secondaryColor),

              Padding(
                padding: const EdgeInsets.all(20),
                child: _NoticeItem(
                  label: "계약서 생성 비용",
                  desc: "${cost.toString().toPriceFormat}₩",
                  descFontSize: 18,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: PrimaryButton.mono(
                        text: '뒤로가기',
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: PrimaryButton.brand(
                        text: isEditMode ? "수정 완료" : "생성하기",
                        onTap: () async {
                          if (isPending.value) return;
                          isPending.value = true;
                          try {
                            if (status == ContractStatus.ready) {
                              // READY > DRAFT 계약서 상태 되돌림 (Ready 상태에서 수정 시)
                              final detailVM = ref.read(
                                detailContractViewModelProvider.notifier,
                              );
                              final success = await detailVM.revert();
                              if (!success) {
                                if (context.mounted) {
                                  final state = ref.read(
                                    detailContractViewModelProvider,
                                  );
                                  showErrorToast(context, state.error!);
                                  detailVM.clearError();
                                }
                                return;
                              }
                            }

                            // EVT-024: contract_form_submitted
                            final createState = ref.read(
                              createContractViewModelProvider,
                            );
                            final aiUsed = ref.read(
                              aiAutoFillViewModelProvider,
                            ).isCompleted;
                            AnalyticsService.track(
                              'contract_form_submitted',
                              properties: {
                                'transaction_type':
                                    createState.deliveryType.name,
                                // 수정 모드는 기존 첨부(existingAttachmentUrls)를 쓰므로
                                // selectedImages만으로는 실제 이미지 개수를 셀 수 없음
                                'image_count':
                                    createState.existingAttachmentUrls.isNotEmpty
                                    ? createState.existingAttachmentUrls.length
                                    : createState.selectedImages.length,
                                'ai_used': aiUsed,
                                'warranty_days':
                                    createState.warrantyPeriodDays,
                                'contract_party_role': createState.role?.name,
                              },
                              ga4: false,
                            );

                            // Draft 항목 업데이트
                            final createVM = ref.read(
                              createContractViewModelProvider.notifier,
                            );
                            final success = await createVM.updateDraftEntries();
                            if (!context.mounted) return;
                            if (!success) {
                              final state = ref.read(
                                createContractViewModelProvider,
                              );
                              showErrorToast(context, state.error!);
                              createVM.clearError();
                              return;
                            }

                            Navigator.pop(context);
                            context.push(AppRoutes.contractPreview);
                          } finally {
                            if (context.mounted) isPending.value = false;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoticeItem extends StatelessWidget {
  const _NoticeItem({
    required this.label,
    required this.desc,
    this.descFontSize,
  });

  final String label;
  final String desc;
  final double? descFontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: context.txt(color: vrc(context).textDisable)),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            desc,
            style: context.txt(
              color: vrc(context).textPrimary,
              fontSize: descFontSize ?? 14,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
