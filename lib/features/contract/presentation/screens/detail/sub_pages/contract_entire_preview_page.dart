import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/contract_pdf_preview_card.dart';

class ContractEntirePreviewPage extends HookConsumerWidget {
  const ContractEntirePreviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "계약서 미리보기",
        onTapLeading: () => context.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ContractPdfPreviewCard(
          isLoading: detailState.isLoadingData,
          pdfBytes: detailState.pdfBytes,
        ),
      ),
    );
  }
}
