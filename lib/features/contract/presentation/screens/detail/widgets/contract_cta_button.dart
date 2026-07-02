import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_dialog.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/presentation/viewmodels/cancel_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/complete_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/guardian_link_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/report_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/revision_request_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/contract_cancel_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/widgets/modals/contract_report_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/delete_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/share_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/guardian_consent_sign_dialog.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';

class ContractCtaButtons extends HookConsumerWidget {
  const ContractCtaButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final isCreator = detailState.isCreator;
    final status = detailState.status;

    final reportState = ref.watch(reportContractViewModelProvider);
    final cancelState = ref.watch(cancelContractViewModelProvider);
    final revisionState = ref.watch(revisionRequestViewModelProvider);

    return switch (status) {
      // 초안 작성중
      ContractStatus.inProgress || ContractStatus.draft => _CtaButtonRow(
        secondary: deleteButton(context, ref),
        primary: writeButton(context, ref),
      ),
      // 계약서 초안
      ContractStatus.ready => _CtaButtonRow(
        secondary: deleteButton(context, ref),
        primary: requestSignButton(context, ref),
      ),
      // 서명 요청
      ContractStatus.shared =>
        isCreator
            ? _CtaButtonRow(
                primary: completeButton(context, ref, disabled: true),
              )
            : _CtaButtonRow(
                primary: signButton(context, ref),
                secondary: cancelButton(context, disabled: true),
              ),
      // 수정 요청
      ContractStatus.revisionRequested =>
        isCreator
            ? _CtaButtonRow(
                primary: requestSignButton(
                  context,
                  ref,
                  disabled: !revisionState.revisionDone,
                ),
              )
            : _CtaButtonRow(
                primary: requestSignButton(context, ref, disabled: true),
              ),
      // 최종 서명 요청
      ContractStatus.receiverSigned =>
        isCreator
            ? _CtaButtonRow(
                secondary: cancelButton(context),
                primary: signButton(context, ref),
              )
            : _CtaButtonRow(
                primary: _CtaButtonRow(
                  primary: completeButton(context, ref, disabled: true),
                ),
              ),
      // 양측 서명 완료
      ContractStatus.signed => _CtaButtonRow(
        secondary: reportButton(context),
        primary: completeButton(context, ref),
      ),
      // 신고 접수
      ContractStatus.reported => _CtaButtonRow(
        primary: cancelReportButton(
          context,
          ref,
          disabled: reportState.recentReport?.isMine != true,
        ),
      ),
      // 취소
      ContractStatus.cancelRequested || ContractStatus.cancelled =>
        cancelState.recentCancel?.isMine == true
            ? _CtaButtonRow(primary: cancelRequestButton(context, ref))
            : _CtaButtonRow(primary: confirmCancelButton(context, ref)),
      // 거래 완료
      ContractStatus.completed => _CtaButtonRow(
        secondary: reportButton(context),
        primary: downloadButton(context, ref),
      ),
    };
  }

  Widget deleteButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    final deleteVM = ref.read(deleteContractViewModelProvider.notifier);

    return _ContractCtaButton(
      isGrayButton: true,
      disabled: disabled,
      text: "삭제하기",
      onTap: () async {
        if (disabled) return;

        await showDialog(
          context: context,
          builder: (_) => CustomDialog(
            title: '삭제 안내',
            content: '삭제하시겠습니까?',
            confirmText: '삭제하기',
            onConfirm: () async {
              if (detailState.status == ContractStatus.ready) {
                final success = await detailVM.revert();
                if (!context.mounted) return;
                if (!success) {
                  final state = ref.read(detailContractViewModelProvider);
                  showErrorToast(context, state.error!);
                  detailVM.clearError();
                  return;
                }
              }

              final success = await deleteVM.deleteDraft(
                detailState.publicCode,
              );
              if (!context.mounted) return;
              if (!success) {
                final state = ref.read(deleteContractViewModelProvider);
                showErrorToast(context, state.error!);
                deleteVM.clearError();
                return;
              }
            },
          ),
        );
        if (!context.mounted) return;
        context.go(AppRoutes.home);
      },
    );
  }

  Widget reportButton(BuildContext context, {bool disabled = false}) {
    return _ContractCtaButton(
      isGrayButton: true,
      disabled: disabled,
      text: "문제 신고",
      onTap: () async {
        if (disabled) return;

        showModalBottomSheet(
          context: context,
          barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (_) => ContractReportBottomSheet(),
        );
      },
    );
  }

  Widget cancelReportButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final reportVM = ref.read(reportContractViewModelProvider.notifier);

    return _ContractCtaButton(
      isGrayButton: true,
      disabled: disabled,
      text: "신고 취소하기",
      onTap: () async {
        if (disabled) return;

        final success = await reportVM.cancelReport(detailState.publicCode);
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(reportContractViewModelProvider);
          showErrorToast(context, state.error!);
          reportVM.clearError();
          return;
        }
      },
    );
  }

  Widget cancelRequestButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    return _ContractCtaButton(
      isGrayButton: true,
      disabled: disabled,
      text: "요청 취소하기",
      onTap: () async {
        if (disabled) return;
      },
    );
  }

  Widget confirmCancelButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final cancelVM = ref.read(cancelContractViewModelProvider.notifier);

    return _ContractCtaButton(
      isGrayButton: true,
      disabled: disabled,
      text: "취소 내용 확인하기",
      onTap: () async {
        if (disabled) return;

        final success = await cancelVM.readCancel(detailState.publicCode);
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(cancelContractViewModelProvider);
          showErrorToast(context, state.error!);
          cancelVM.clearError();
          return;
        }

        showModalBottomSheet(
          context: context,
          barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (_) => ContractCancelBottomSheet(),
        );
      },
    );
  }

  Widget requestSignButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    final detailState = ref.read(detailContractViewModelProvider);
    final shareVM = ref.read(shareContractViewModelProvider.notifier);

    return _ContractCtaButton(
      disabled: disabled,
      text: "서명 요청하기",
      onTap: () async {
        if (disabled) return;

        // 수정 요청 상태 > 서명 요청
        if (detailState.status == ContractStatus.revisionRequested) {
          final success = await shareVM.reshare(detailState.publicCode);
          if (!context.mounted) return;
          if (!success) {
            final state = ref.read(shareContractViewModelProvider);
            showErrorToast(context, state.error!);
            shareVM.clearError();
            return;
          }
          // 계약서 초안 > 서명 요청
        } else {
          context.push(AppRoutes.contractShare, extra: detailState.publicCode);
        }
      },
    );
  }

  Widget completeButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final completeVM = ref.read(completeContractViewModelProvider.notifier);

    return _ContractCtaButton(
      disabled: disabled,
      text: "거래 완료 확정",
      onTap: () async {
        if (disabled) return;

        final success = await completeVM.complete(detailState.publicCode);
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(completeContractViewModelProvider);
          showErrorToast(context, state.error!);
          completeVM.clearError();
          return;
        }
      },
    );
  }

  Widget downloadButton(BuildContext context, WidgetRef ref) {
    final detailVM = ref.read(detailContractViewModelProvider.notifier);

    return _ContractCtaButton(
      disabled: false,
      text: "거래 계약서 다운로드",
      onTap: () async {
        final success = await detailVM.downloadPdf();
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(detailContractViewModelProvider);
          showErrorToast(context, state.error!);
          detailVM.clearError();
          return;
        }
      },
    );
  }

  Widget writeButton(BuildContext context, WidgetRef ref) {
    final detailState = ref.read(detailContractViewModelProvider);
    final createVM = ref.read(createContractViewModelProvider.notifier);

    return _ContractCtaButton(
      disabled: false,
      text: "이어서 작성하기",
      onTap: () async {
        createVM.loadFromDraft(
          publicCode: detailState.publicCode,
          consentType: detailState.consentType,
          deliveryType: detailState.deliveryType,
          role: detailState.myRole,
          attachmentIds: detailState.attachmentIds,
          existingAttachmentUrls: detailState.attachmentImageUrls,
          tradingPlatform: detailState.tradingPlatform ?? '',
          title: detailState.title ?? '',
          price: detailState.price ?? 0,
          conditionSummary: detailState.conditionSummary ?? '',
          conditionDetails: detailState.conditionDetails ?? '',
          warrantyPeriodDays: detailState.warrantyPeriodDays,
        );

        switch (ref.read(createContractViewModelProvider).consentType) {
          case null:
            return;
          case ConsentType.notApplicable:
            detailState.myRole == null
                ? context.push(AppRoutes.selectRole)
                : context.push(AppRoutes.contractCreate);
            return;
          case ConsentType.guardianRequired:
            showDialog(
              barrierColor: Colors.black.withValues(alpha: 0.75),
              context: context,
              builder: (context) =>
                  const GuardianConsentSignDialog(isCreator: true),
            );
            return;
        }
      },
    );
  }

  Widget cancelButton(BuildContext context, {bool disabled = false}) {
    return _ContractCtaButton(
      isGrayButton: true,
      disabled: disabled,
      text: "취소하기",
      onTap: () async {
        if (disabled) return;

        showModalBottomSheet(
          context: context,
          barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (_) => ContractCancelBottomSheet(),
        );
      },
    );
  }

  Widget signButton(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final me = ref.read(meProvider).value;
    final isMinor = me?.ageGroup == 'MINOR';

    return _ContractCtaButton(
      disabled: false,
      text: "서명하기",
      onTap: () async {
        if (detailState.status == ContractStatus.shared) {
          if (isMinor) {
            // 이미 인증 완료이면 바로 페이지 이동
            final guardianState = ref.read(guardianLinkViewModelProvider);
            if (guardianState.isConsented) {
              detailState.isCreator
                  ? context.go(AppRoutes.selectRole)
                  : context.go(AppRoutes.requestDetail);
              return;
            }

            showDialog(
              barrierColor: Colors.black.withValues(alpha: 0.75),
              context: context,
              builder: (context) =>
                  const GuardianConsentSignDialog(isCreator: false),
            );
          } else {
            context.push(AppRoutes.requestDetail);
          }
        } else if (detailState.status == ContractStatus.receiverSigned) {
          context.push(AppRoutes.finalPreview);
        } else {
          return;
        }
      },
    );
  }
}

class _CtaButtonRow extends StatelessWidget {
  final Widget primary;
  final Widget? secondary;

  const _CtaButtonRow({required this.primary, this.secondary});

  @override
  Widget build(BuildContext context) {
    if (secondary == null) return primary;
    return Row(
      children: [
        Expanded(flex: 3, child: secondary!),
        const SizedBox(width: 10),
        Expanded(flex: 7, child: primary),
      ],
    );
  }
}

class _ContractCtaButton extends HookConsumerWidget {
  const _ContractCtaButton({
    required this.disabled,
    required this.text,
    required this.onTap,
    this.isGrayButton = false,
  });

  final bool disabled;
  final String text;
  final Future<void> Function() onTap;
  final bool isGrayButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final status = detailState.status;
    final isPending = useRef(false);

    return GestureDetector(
      onTap: disabled
          ? null
          : () async {
              if (isPending.value) return;
              isPending.value = true;
              try {
                await onTap();
              } finally {
                isPending.value = false;
              }
            },
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (disabled || isGrayButton)
              ? vrc(context).secondaryColor
              : status.statusColor(context),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: context.txt(
            color: disabled
                ? vrc(context).textDisable
                : isGrayButton
                ? vrc(context).textPrimary
                : fxc(context).textBrand,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
