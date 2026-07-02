import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/sign_confirm_bottom_sheet.dart';

class ContractFinalPreviewPage extends HookConsumerWidget {
  const ContractFinalPreviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final isPending = useRef(false);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        backgroundColor: vrc(context).background,
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(
            CooliconsIcon.chevronLeft,
            color: vrc(context).iconPrimary,
            size: 24,
          ),
        ),
        title: Text(
          "계약서 미리보기",
          style: context.txt(
            color: vrc(context).textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: fxc(context).borderOP!),
                ),
                child: detailState.isLoading
                    ? const CustomLoadingBar()
                    : detailState.pdfBytes == null
                    ? Center(
                        child: Text('PDF를 불러올 수 없습니다.', style: context.txt()),
                      )
                    : SfPdfViewerTheme(
                        data: SfPdfViewerThemeData(
                          backgroundColor: vrc(context).secondaryColor,
                          progressBarColor: fxc(context).brandColor!,
                          scrollHeadStyle: PdfScrollHeadStyle(
                            backgroundColor: vrc(context).background,
                          ),
                        ),
                        child: SfPdfViewer.memory(detailState.pdfBytes!),
                      ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: PrimaryButton(
            text: "서명하기",
            onTap: () async {
              if (isPending.value) return;
              isPending.value = true;
              try {
                bool signFlowProceeded = false;
                final router = GoRouter.of(context);
                await showModalBottomSheet<void>(
                  context: context,
                  barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (_) => SignConfirmBottomSheet(
                    parentContext: context,
                    onProceed: () => signFlowProceeded = true,
                  ),
                );
                if (!signFlowProceeded && context.mounted) {
                  router.go(AppRoutes.home);
                }
              } finally {
                isPending.value = false;
              }
            },
            backgroundColor: fxc(context).brandColor!,
            foregroundColor: fxc(context).textBrand!,
          ),
        ),
      ),
    );
  }
}
