import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/screens/preview/widgets/contract_completion_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/revision_request_view_model.dart';

class ContractPreviewPage extends HookConsumerWidget {
  const ContractPreviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createState = ref.watch(createContractViewModelProvider);
    final createVM = ref.read(createContractViewModelProvider.notifier);
    final revisionVM = ref.read(revisionRequestViewModelProvider.notifier);

    final revisionRequested = createState.revisionRequested;
    final isPending = useRef(false);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final success = await createVM.readPdfPreview();
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(createContractViewModelProvider);
          showErrorToast(context, state.error!);
          createVM.clearError();
        }
      });
      return null;
    }, []);

    const int currentStep = 3;
    const int totalStep = 3;
    final double progress = currentStep / totalStep;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "계약서 미리보기",
        onTapLeading: () => context.pop(),
        bottomProgress: progress,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: fxc(context).borderOP!),
          ),
          child: createState.isLoading
              ? const CustomLoadingBar()
              : createState.pdfBytes == null
              ? Center(child: Text('PDF를 불러올 수 없습니다.', style: context.txt()))
              : SfPdfViewerTheme(
                  data: SfPdfViewerThemeData(
                    backgroundColor: vrc(context).secondaryColor,
                    progressBarColor: fxc(context).brandColor!,
                    scrollHeadStyle: PdfScrollHeadStyle(
                      backgroundColor: vrc(context).background,
                    ),
                  ),
                  child: SfPdfViewer.memory(createState.pdfBytes!),
                ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  text: "수정하기",
                  onTap: () => context.pop(),
                  backgroundColor: vrc(context).secondaryColor!,
                  foregroundColor: vrc(context).textPrimary!,
                ),
              ),
              const SizedBox(width: 9),
              Expanded(
                child: PrimaryButton(
                  text: revisionRequested ? "수정 완료" : "생성하기",
                  onTap: () async {
                    if (isPending.value) return;
                    isPending.value = true;
                    try {
                      if (revisionRequested) {
                        revisionVM.revisionDone();
                        context.go(AppRoutes.contractDetail);
                      } else {
                        final success = await createVM.ready();
                        if (!context.mounted) return;
                        if (!success) {
                          final state = ref.read(
                            createContractViewModelProvider,
                          );
                          showErrorToast(context, state.error!);
                          createVM.clearError();
                          return;
                        }

                        showModalBottomSheet(
                          context: context,
                          barrierColor: const Color(
                            0xFF000000,
                          ).withValues(alpha: 0.75),
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (bottomSheetContext) =>
                              ContractCompletionBottomSheet(
                                parentContext: context,
                              ),
                        );
                      }
                    } finally {
                      isPending.value = false;
                    }
                  },
                  backgroundColor: fxc(context).brandColor!,
                  foregroundColor: fxc(context).textBrand!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
