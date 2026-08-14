import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_dialog.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/report_contract_view_model.dart';

class ContractReportBottomSheet extends HookConsumerWidget {
  const ContractReportBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.read(detailContractViewModelProvider);
    final publicCode = detailState.publicCode;
    final isPending = useRef(false);

    final reasonCtr = useTextEditingController();
    final detailCtr = useTextEditingController();

    useEffect(() {
      // EVT-059: issue_report_started
      AnalyticsService.track(
        'issue_report_started',
        properties: {
          'contract_id': publicCode,
          'contract_status': detailState.status.name,
          'actor_role': detailState.isCreator ? 'creator' : 'receiver',
        },
        ga4: false,
      );
      return null;
    }, const []);

    useListenable(reasonCtr);
    useListenable(detailCtr);

    final isEnabled =
        reasonCtr.text.trim().isNotEmpty && detailCtr.text.trim().isNotEmpty;

    return PendingOverlay(
      isPending: isPending.value,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          20,
          20,
          20,
          MediaQuery.of(context).viewInsets.bottom + 10,
        ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 28,
                    width: 28,
                    padding: const EdgeInsets.only(bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fxc(context).opacityError,
                    ),
                    child: Icon(
                      CooliconsIcon.triangleWarning,
                      color: fxc(context).iconDanger,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "문제 신고",
                    style: context.txt(
                      color: vrc(context).textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ContractFormField(
                label: "신고 사유",
                hintText: "신고 사유를 입력해주세요.",
                controller: reasonCtr,
                maxLines: 1,
              ),
              const SizedBox(height: 8),
              ContractFormField(
                label: "상세 내용",
                hintText: "문제를 자세히 설명해 주세요.",
                controller: detailCtr,
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                text: "다음",
                disabled: !isEnabled,
                onTap: () async {
                  await showCustomDialog(
                    context: context,
                    title: '신고 안내',
                    content: '신고를 접수하시겠어요?\n확인 시 신고가 접수됩니다',
                    onConfirm: () async {
                      if (isPending.value) return;
                      isPending.value = true;
                      try {
                        final reportVM = ref.read(
                          reportContractViewModelProvider.notifier,
                        );
                        reportVM.updateInput(
                          reason: reasonCtr.text,
                          detail: detailCtr.text,
                        );

                        // 신고 접수
                        final success = await reportVM.report(publicCode);
                        if (!context.mounted) return;
                        if (!success) {
                          final state = ref.read(
                            reportContractViewModelProvider,
                          );
                          showErrorToast(context, state.error!);
                          reportVM.clearError();
                          return;
                        }

                        context.pop();
                      } finally {
                        if (context.mounted) isPending.value = false;
                      }
                    },
                  );
                },
                backgroundColor: fxc(context).opacityError!,
                foregroundColor: fxc(context).textDanger!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
