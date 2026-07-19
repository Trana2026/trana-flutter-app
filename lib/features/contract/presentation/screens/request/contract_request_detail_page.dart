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
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/receive_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/contract_pdf_preview_card.dart';
import 'package:trana/features/contract/presentation/widgets/contract_warranty_section.dart';
import 'package:trana/features/contract/presentation/widgets/modals/sign_confirm_bottom_sheet.dart';

class ContractRequestDetailPage extends HookConsumerWidget {
  const ContractRequestDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final receiveVM = ref.read(receiveContractViewModelProvider.notifier);

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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ContractPdfPreviewCard(
                  isLoading: detailState.isLoadingData,
                  pdfBytes: detailState.pdfBytes,
                ),
              ),

              // 판매자일 때만 보증 기간 선택 영역 노출
              if (detailState.myRole == Role.seller) ...[
                const SizedBox(height: 12),
                const ContractWarrantySection(),
              ],
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
                        if (detailState.myRole == Role.seller) {
                          // 수신자(판매자) 보증 기간 변경 (판매자일 때)
                          final success = await receiveVM.receiverWarranty(
                            detailState.publicCode,
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
