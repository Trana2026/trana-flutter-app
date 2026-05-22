import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/contract_request_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/sign_confirm_bottom_sheet.dart';

class ContractRequestPage extends HookConsumerWidget {
  const ContractRequestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestState = ref.watch(contractRequestViewModelProvider);
    final requestVM = ref.read(contractRequestViewModelProvider.notifier);

    ref.listen(contractRequestViewModelProvider, (prev, next) {
      if (next.error != null && next.error != prev?.error) {
        showErrorToast(context, next.error!);
        requestVM.clearError();
      }
    });

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        backgroundColor: vrc(context).background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "계약서 공유하기",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontFamily: "PretendardBold",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: fxc(context).borderOP!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: requestState.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: fxc(context).brandColor,
                            strokeWidth: 3,
                          ),
                        )
                      : requestState.pdfBytes == null
                      ? Center(
                          child: Text(
                            '계약서를 불러올 수 없습니다.',
                            style: TextStyle(
                              color: vrc(context).textSecondary,
                              fontFamily: 'PretendardMedium',
                            ),
                          ),
                        )
                      : SfPdfViewerTheme(
                          data: SfPdfViewerThemeData(
                            backgroundColor: vrc(context).secondaryColor,
                            progressBarColor: fxc(context).brandColor!,
                          ),
                          child: SfPdfViewer.memory(requestState.pdfBytes!),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 45),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: "수정하기",
                    onTap: () {},
                    backgroundColor: vrc(context).secondaryColor!,
                    foregroundColor: vrc(context).textPrimary!,
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: PrimaryButton(
                    text: "서명하기",
                    onTap: () async {
                      if (!context.mounted) return;
                      bool signFlowProceeded = false;
                      final router = GoRouter.of(context);
                      await showModalBottomSheet<void>(
                        context: context,
                        barrierColor: const Color(
                          0xFF000000,
                        ).withValues(alpha: 0.75),
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
                    },
                    backgroundColor: fxc(context).brandColor!,
                    foregroundColor: fxc(context).textBrand!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
