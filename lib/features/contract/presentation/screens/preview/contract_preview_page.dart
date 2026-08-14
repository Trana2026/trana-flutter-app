import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_bottom_sheet.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/screens/preview/widgets/contract_completion_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/viewmodels/ai_auto_fill_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/revision_request_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/contract_pdf_preview_card.dart';

class ContractPreviewPage extends HookConsumerWidget {
  const ContractPreviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (isLoadingPdf, pdfBytes, isEditMode) = ref.watch(
      createContractViewModelProvider.select(
        (s) => (s.isLoadingPdf, s.pdfBytes, s.isEditMode),
      ),
    );
    final status = ref.read(detailContractViewModelProvider).status;
    final isPending = useState(false);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // PDF 생성
        final createVM = ref.read(createContractViewModelProvider.notifier);
        final success = await createVM.readPdfPreview();
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(createContractViewModelProvider);
          showErrorToast(context, state.error!);
          createVM.clearError();
          return;
        }

        // EVT-027: contract_draft_viewed
        final createState = ref.read(createContractViewModelProvider);
        AnalyticsService.track(
          'contract_draft_viewed',
          properties: {
            'contract_id': createState.publicCode,
            'entry_point': createState.isEditMode
                ? 'edit'
                : createState.isContinueMode
                ? 'continue'
                : 'contract_create_form',
            'ai_used': ref.read(aiAutoFillViewModelProvider).isCompleted,
            'contract_party_role': createState.role?.name,
          },
        );
      });
      return null;
    }, []);

    const int currentStep = 3;
    const int totalStep = 3;
    final double progress = currentStep / totalStep;

    return PendingOverlay(
      isPending: isPending.value,
      child: Scaffold(
        backgroundColor: vrc(context).background,
        appBar: CustomAppBar.leading(
          title: "계약서 미리보기",
          onTapLeading: () => context.pop(),
          bottomProgress: progress,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ContractPdfPreviewCard(
            isLoading: isLoadingPdf,
            pdfBytes: pdfBytes,
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
                    onTap: () {
                      // EVT-028: contract_edit_started
                      final createState = ref.read(
                        createContractViewModelProvider,
                      );
                      AnalyticsService.track(
                        'contract_edit_started',
                        properties: {
                          'contract_id': createState.publicCode,
                          'edit_source': 'preview',
                          'ai_used': ref
                              .read(aiAutoFillViewModelProvider)
                              .isCompleted,
                        },
                        ga4: false,
                      );
                      context.pop();
                    },
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: PrimaryButton.brand(
                    text: isEditMode ? "수정 완료" : "생성하기",
                    onTap: () async {
                      if (isPending.value) return;
                      isPending.value = true;
                      try {
                        // 1. 수정 모드
                        if (isEditMode) {
                          // 수정 요청 > 완료 상태 변경
                          final revisionVM = ref.read(
                            revisionRequestViewModelProvider.notifier,
                          );
                          revisionVM.revisionDone(true);

                          if (status == ContractStatus.draft) {
                            // DRAFT > Ready 상태 전이 (Draft 상태에서 수정 했을 때)
                            final createVM = ref.read(
                              createContractViewModelProvider.notifier,
                            );
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
                          }

                          context.go(AppRoutes.contractDetail);
                          // 2. 생성 모드
                        } else {
                          // DRAFT > Ready 상태 전이
                          final createVM = ref.read(
                            createContractViewModelProvider.notifier,
                          );
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

                          await showCustomBottomSheet(
                            context,
                            const ContractCompletionBottomSheet(),
                          );
                        }
                      } finally {
                        if (context.mounted) isPending.value = false;
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
