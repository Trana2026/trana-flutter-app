import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_bottom_sheet.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/minor_disclosure_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/receive_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/contract_pdf_preview_card.dart';
import 'package:trana/features/contract/presentation/widgets/contract_warranty_section.dart';
import 'package:trana/features/contract/presentation/widgets/modals/sign_confirm_bottom_sheet.dart';

class ContractRequestDetailPage extends HookConsumerWidget {
  const ContractRequestDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (isLoadingData, pdfBytes, isSeller) = ref.watch(
      detailContractViewModelProvider.select(
        (s) => (s.isLoadingData, s.pdfBytes, s.isSeller),
      ),
    );
    final DetailContractState(:publicCode, :counterpartyIsMinor) = ref.read(
      detailContractViewModelProvider,
    );
    final isPending = useState(false);

    return PendingOverlay(
      isPending: isPending.value,
      child: Scaffold(
        backgroundColor: vrc(context).background,
        appBar: CustomAppBar.leading(
          title: "계약서 미리보기",
          onTapLeading: () => context.go(AppRoutes.home),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: ContractPdfPreviewCard(
                  isLoading: isLoadingData,
                  pdfBytes: pdfBytes,
                ),
              ),
              const SizedBox(height: 12),

              // 판매자일 때만 보증 기간 선택 영역 노출
              if (isSeller) const ContractWarrantySection(),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: PrimaryButton.mono(
                    text: "수정하기",
                    onTap: () => context.push(AppRoutes.revisionRequest),
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: PrimaryButton.brand(
                    text: "서명하기",
                    onTap: () async {
                      if (isPending.value) return;
                      isPending.value = true;
                      try {
                        if (isSeller) {
                          // 수신자(판매자) 보증 기간 변경 (판매자일 때)
                          final receiveVM = ref.read(
                            receiveContractViewModelProvider.notifier,
                          );
                          final success = await receiveVM.receiverWarranty(
                            publicCode,
                          );
                          if (!context.mounted) return;
                          if (!success) {
                            final state = ref.read(
                              receiveContractViewModelProvider,
                            );
                            showErrorToast(context, state.error!);
                            receiveVM.clearError();
                            return;
                          }
                        }

                        if (counterpartyIsMinor) {
                          // 미성년자 위험 고지 문구 조회 (상대가 미성년자일 때)
                          final disclosureVM = ref.read(
                            minorDisclosureViewModelProvider.notifier,
                          );
                          final success = await disclosureVM.readText();
                          if (!context.mounted) return;
                          if (!success) {
                            final state = ref.read(
                              minorDisclosureViewModelProvider,
                            );
                            showErrorToast(context, state.error!);
                            disclosureVM.clearError();
                            return;
                          }
                        }

                        await showCustomBottomSheet<void>(
                          context,
                          SignConfirmBottomSheet(parentContext: context),
                        );
                      } finally {
                        isPending.value = false;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
