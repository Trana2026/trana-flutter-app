import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_dialog.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/domain/enums/cancellation_reason.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/viewmodels/cancel_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';

class ContractCancelBottomSheet extends HookConsumerWidget {
  const ContractCancelBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(
      detailContractViewModelProvider.select((s) => s.status),
    );
    final (
      recentCancelReason,
      recentCancelDetail,
      recentCancelIsMine,
    ) = ref.watch(
      cancelContractViewModelProvider.select(
        (s) =>
            (s.recentCancelReason, s.recentCancelDetail, s.recentCancelIsMine),
      ),
    );
    final publicCode = ref.read(detailContractViewModelProvider).publicCode;

    final isRequested = status == ContractStatus.cancelRequested;
    final isMyCancel = (isRequested && recentCancelIsMine);

    final initialReason = isRequested ? recentCancelReason : "";
    final initialDetail = isRequested ? recentCancelDetail : "";

    final reasonCtr = useTextEditingController(text: initialReason);
    final detailCtr = useTextEditingController(text: initialDetail);
    final isPending = useState(false);

    useListenable(detailCtr);

    useEffect(() {
      // modal_viewed: 계약 취소 바텀시트
      AnalyticsService.trackScreenView(
        'contract_cancel_modal',
        entryPoint: 'contract_detail',
      );
      return null;
    }, const []);

    final isEnabled = (detailCtr.text.trim().isNotEmpty);

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
                    "계약 취소 요청",
                    style: context.txt(
                      color: vrc(context).textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              isRequested
                  ? ContractFormField(
                      label: "취소 사유",
                      hintText: "취소 사유를 입력해주세요.",
                      controller: reasonCtr,
                      maxLines: 1,
                      readOnly: isRequested,
                    )
                  : const _CancelReasonDropdown(),
              const SizedBox(height: 8),
              ContractFormField(
                label: "상세 내용",
                hintText: "문제를 자세히 설명해 주세요.",
                controller: detailCtr,
                maxLines: 4,
                readOnly: isRequested,
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                text: (!isRequested || isMyCancel) ? "취소 요청하기" : "계약 취소하기",
                disabled: !isEnabled || isMyCancel,
                onTap: () async {
                  await showCustomDialog(
                    context: context,
                    title: !isRequested ? "취소 요청 안내" : "취소 확정 안내",
                    content: !isRequested
                        ? "취소 요청을 진행하시겠어요?\n확인 시 상대방에게 전달됩니다"
                        : "확정하면 계약이 즉시 삭제되며\n취소가 확정된 계약은 복구할 수 없어요",
                    onConfirm: () async {
                      if (isPending.value) return;
                      isPending.value = true;
                      try {
                        // 1. 취소 요청 전
                        final cancelVM = ref.read(
                          cancelContractViewModelProvider.notifier,
                        );
                        if (!isRequested) {
                          cancelVM.updateDetail(detailCtr.text);

                          // 취소 요청 접수
                          final success = await cancelVM.requestCancel(
                            publicCode,
                          );
                          if (!context.mounted) return;
                          if (!success) {
                            final state = ref.read(
                              cancelContractViewModelProvider,
                            );
                            showErrorToast(context, state.error!);
                            cancelVM.clearError();
                            return;
                          }

                          context.pop();
                          // 2. 취소 요청된 상태
                        } else {
                          // 취소 확정
                          final success = await cancelVM.confirmCancel(
                            publicCode,
                          );
                          if (!context.mounted) return;
                          if (!success) {
                            final state = ref.read(
                              cancelContractViewModelProvider,
                            );
                            showErrorToast(context, state.error!);
                            cancelVM.clearError();
                            return;
                          }

                          showCustomToast(
                            context,
                            '계약이 취소되었습니다',
                            customAppIcon: AppIcon.data(
                              icon: CooliconsIcon.triangleWarning,
                              color: fxc(context).statusError,
                            ),
                          );

                          context.pop();
                          context.go(AppRoutes.home);
                        }
                      } finally {
                        isPending.value = false;
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

class _CancelReasonDropdown extends HookConsumerWidget {
  const _CancelReasonDropdown();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cancelVM = ref.read(cancelContractViewModelProvider.notifier);
    final selectedReason = useState(CancellationReason.reportHistory);

    final double itemHeight = 50;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "취소 사유",
          style: context.txt(color: vrc(context).textTertiary, fontSize: 12),
        ),
        const SizedBox(height: 4),
        DropdownButtonHideUnderline(
          child: DropdownButton2<CancellationReason>(
            valueListenable: selectedReason,
            isExpanded: false,
            onChanged: (v) {
              selectedReason.value = v!;
              cancelVM.updateReason(v);
            },
            items: CancellationReason.values.map((reason) {
              return DropdownItem(
                value: reason,
                height: itemHeight,
                child: Text(
                  reason.label,
                  style: context.txt(color: vrc(context).textPrimary),
                ),
              );
            }).toList(),
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.expand_more,
                size: 30,
                color: vrc(context).iconSecondary,
              ),
            ),

            buttonStyleData: ButtonStyleData(
              height: itemHeight,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: vrc(context).secondaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),

            dropdownStyleData: DropdownStyleData(
              offset: const Offset(0, -8),
              elevation: 2,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: vrc(context).secondaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              scrollbarTheme: const ScrollbarThemeData(
                thumbVisibility: WidgetStatePropertyAll(false),
                trackVisibility: WidgetStatePropertyAll(false),
                thickness: WidgetStatePropertyAll(0),
              ),
            ),

            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),

            dropdownSeparator: DropdownSeparator(
              height: 1,
              child: Divider(
                height: 1,
                thickness: 1,
                color: vrc(context).tertiaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
