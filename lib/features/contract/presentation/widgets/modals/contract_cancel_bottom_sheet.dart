import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/cancel_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';

class ContractCancelBottomSheet extends HookConsumerWidget {
  const ContractCancelBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final cancelState = ref.watch(cancelContractViewModelProvider);
    final cancelVM = ref.read(cancelContractViewModelProvider.notifier);

    final notCancelState = cancelState.recentCancel == null;
    final receiveCancel = cancelState.recentCancel?.isMine == false;

    final initialReason = receiveCancel ? cancelState.recentCancel?.reason : "";
    final initialDetail = receiveCancel ? cancelState.recentCancel?.detail : "";

    final reasonCtr = useTextEditingController(text: initialReason);
    final detailCtr = useTextEditingController(text: initialDetail);
    final isPending = useRef(false);

    useListenable(reasonCtr);
    useListenable(detailCtr);

    final isEnabled =
        reasonCtr.text.trim().isNotEmpty && detailCtr.text.trim().isNotEmpty;

    return Container(
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
            ContractFormField(
              label: "취소 사유",
              hintText: "취소 사유를 입력해주세요.",
              controller: reasonCtr,
              maxLines: 1,
              readOnly: !notCancelState,
            ),
            const SizedBox(height: 8),
            ContractFormField(
              label: "상세 내용",
              hintText: "문제를 자세히 설명해 주세요.",
              controller: detailCtr,
              maxLines: 4,
              readOnly: !notCancelState,
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              text: notCancelState ? "취소 요청하기" : "계약 취소하기",
              onTap: () async {
                if (!isEnabled) return;
                if (isPending.value) return;
                isPending.value = true;
                try {
                  if (notCancelState) {
                    cancelVM.updateInput(
                      reason: reasonCtr.text,
                      detail: detailCtr.text,
                    );

                    final success = await cancelVM.requestCancel(
                      detailState.publicCode,
                    );
                    if (!context.mounted) return;
                    if (!success) {
                      final state = ref.read(cancelContractViewModelProvider);
                      showErrorToast(context, state.error!);
                      cancelVM.clearError();
                      return;
                    }

                    context.pop();
                  } else {
                    final success = await cancelVM.confirmCancel(
                      detailState.publicCode,
                    );
                    if (!context.mounted) return;
                    if (!success) {
                      final state = ref.read(cancelContractViewModelProvider);
                      showErrorToast(context, state.error!);
                      cancelVM.clearError();
                      return;
                    }

                    context.pop();
                    context.go(AppRoutes.home);
                  }
                } finally {
                  isPending.value = false;
                }
              },
              backgroundColor: isEnabled
                  ? fxc(context).opacityError!
                  : vrc(context).disableColor!,
              foregroundColor: isEnabled
                  ? fxc(context).textDanger!
                  : vrc(context).textDisable!,
            ),
          ],
        ),
      ),
    );
  }
}
