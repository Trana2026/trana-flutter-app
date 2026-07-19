import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_bottom_sheet.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/contract_pdf_preview_card.dart';
import 'package:trana/features/contract/presentation/widgets/modals/sign_confirm_bottom_sheet.dart';

class ContractFinalPreviewPage extends HookConsumerWidget {
  const ContractFinalPreviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);

    final isPending = useRef(false);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "계약서 미리보기",
        onTapLeading: () => context.pop(),
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
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: PrimaryButton.brand(
            text: "서명하기",
            onTap: () async {
              if (isPending.value) return;
              isPending.value = true;
              try {
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
      ),
    );
  }
}
