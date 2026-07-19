import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_bottom_sheet.dart';
import 'package:trana/core/widgets/custom_dialog.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/presentation/viewmodels/cancel_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/complete_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/delete_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/report_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/revision_request_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/share_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/contract_cancel_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/widgets/modals/contract_report_bottom_sheet.dart';

class ContractCtaButtons extends HookConsumerWidget {
  const ContractCtaButtons({super.key, required this.isPending});

  final ValueNotifier<bool> isPending;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportState = ref.watch(reportContractViewModelProvider);
    final cancelState = ref.watch(cancelContractViewModelProvider);
    final revisionState = ref.watch(revisionRequestViewModelProvider);
    final detailState = ref.watch(detailContractViewModelProvider);

    final status = detailState.status;
    final isCreator = detailState.isCreator;
    final isSeller =
        (detailState.myRole != null) && (detailState.myRole! == Role.seller);

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
                secondary: cancelButton(
                  context,
                  ref,
                  disabled: !detailState.canCancel,
                ),
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
                secondary: cancelButton(
                  context,
                  ref,
                  disabled: !detailState.canCancel,
                ),
                primary: signButton(context, ref),
              )
            : _CtaButtonRow(
                primary: completeButton(context, ref, disabled: true),
              ),

      // 양측 서명 완료
      ContractStatus.signed => _CtaButtonRow(
        secondary: reportButton(context, ref),
        primary: completeButton(context, ref, disabled: isSeller),
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
        (cancelState.recentCancel != null && cancelState.recentCancel!.isMine)
            ? _CtaButtonRow(primary: cancelRequestButton(context, ref))
            : _CtaButtonRow(primary: confirmCancelButton(context, ref)),
      // 거래 완료
      ContractStatus.completed => _CtaButtonRow(
        secondary: reportButton(context, ref),
        primary: downloadButton(context, ref),
      ),
    };
  }

  /// 삭제 버튼
  Widget deleteButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    final deleteVM = ref.read(deleteContractViewModelProvider.notifier);

    return _ctaButton(
      context,
      ref,
      monoStyle: true,
      text: "삭제하기",
      disabled: disabled,
      onTap: () async {
        await showCustomDialog(
          context: context,
          title: '삭제하시겠습니까?',
          confirmText: '삭제하기',
          onConfirm: () async {
            if (detailState.status == ContractStatus.ready) {
              // READY > DRAFT 계약 상태 되돌림
              final success = await detailVM.revert();
              if (!context.mounted) return;
              if (!success) {
                final state = ref.read(detailContractViewModelProvider);
                showErrorToast(context, state.error!);
                detailVM.clearError();
                return;
              }
            }

            // Draft 삭제
            final success = await deleteVM.deleteDraft(detailState.publicCode);
            if (!context.mounted) return;
            if (!success) {
              final state = ref.read(deleteContractViewModelProvider);
              showErrorToast(context, state.error!);
              deleteVM.clearError();
              return;
            }
          },
        );

        if (!context.mounted) return;
        context.go(AppRoutes.home);
      },
    );
  }

  /// 신고 버튼
  Widget reportButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    return _ctaButton(
      context,
      ref,
      monoStyle: true,
      text: "문제 신고",
      disabled: disabled,
      onTap: () async {
        showCustomBottomSheet(context, const ContractReportBottomSheet());
      },
    );
  }

  /// 신고 취소 버튼
  Widget cancelReportButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final reportVM = ref.read(reportContractViewModelProvider.notifier);

    return _ctaButton(
      context,
      ref,
      monoStyle: true,
      text: "신고 취소하기",
      disabled: disabled,
      onTap: () async {
        await showCustomDialog(
          context: context,
          title: '신고를 취소하시겠습니까?',
          onConfirm: () async {
            // 신고 취소
            final success = await reportVM.cancelReport(detailState.publicCode);
            if (!context.mounted) return;
            if (!success) {
              final state = ref.read(reportContractViewModelProvider);
              showErrorToast(context, state.error!);
              reportVM.clearError();
            }
          },
        );
      },
    );
  }

  /// 취소 요청 취소하기 버튼
  Widget cancelRequestButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final cancelVM = ref.read(cancelContractViewModelProvider.notifier);

    return _ctaButton(
      context,
      ref,
      monoStyle: true,
      text: "요청 취소하기",
      disabled: disabled,
      onTap: () async {
        await showCustomDialog(
          context: context,
          title: '취소 요청을 취소하시겠습니까?',
          onConfirm: () async {
            // 취소 요청 취소
            final success = await cancelVM.revokeCancel(detailState.publicCode);
            if (!context.mounted) return;
            if (!success) {
              final state = ref.read(cancelContractViewModelProvider);
              showErrorToast(context, state.error!);
              cancelVM.clearError();
            }
          },
        );
      },
    );
  }

  /// 취소 확인 버튼
  Widget confirmCancelButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final cancelVM = ref.read(cancelContractViewModelProvider.notifier);

    return _ctaButton(
      context,
      ref,
      monoStyle: true,
      text: "취소 내용 확인하기",
      disabled: disabled,
      onTap: () async {
        // 취소 요청 내용 조회
        final success = await cancelVM.readCancel(detailState.publicCode);
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(cancelContractViewModelProvider);
          showErrorToast(context, state.error!);
          cancelVM.clearError();
          return;
        }

        showCustomBottomSheet(context, const ContractCancelBottomSheet());
      },
    );
  }

  /// 서명 요청 버튼
  Widget requestSignButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    final detailState = ref.read(detailContractViewModelProvider);
    final shareVM = ref.read(shareContractViewModelProvider.notifier);

    return _ctaButton(
      context,
      ref,
      text: "서명 요청하기",
      disabled: disabled,
      onTap: () async {
        // 1. 수정 요청 상태일 때
        if (detailState.status == ContractStatus.revisionRequested) {
          await showCustomDialog(
            context: context,
            title: '거래 상대방에게\n다시 서명을 요청하시겠습니까?',
            onConfirm: () async {
              // 재서명 요청
              final success = await shareVM.reshare(detailState.publicCode);
              if (!context.mounted) return;
              if (!success) {
                final state = ref.read(shareContractViewModelProvider);
                showErrorToast(context, state.error!);
                shareVM.clearError();
              }
            },
          );

          // 2. 계약서 초안 상태일 때
        } else {
          context.push(AppRoutes.contractShare, extra: detailState.publicCode);
        }
      },
    );
  }

  /// 거래 완료 버튼
  Widget completeButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final completeVM = ref.read(completeContractViewModelProvider.notifier);

    return _ctaButton(
      context,
      ref,
      text: "거래 완료 확정",
      disabled: disabled,
      onTap: () async {
        await showCustomDialog(
          context: context,
          title: '거래 완료를 확정하시겠습니까?',
          onConfirm: () async {
            // 거래 완료
            final success = await completeVM.complete(detailState.publicCode);
            if (!context.mounted) return;
            if (!success) {
              final state = ref.read(completeContractViewModelProvider);
              showErrorToast(context, state.error!);
              completeVM.clearError();
            }
          },
        );
      },
    );
  }

  /// 계약서 다운로드 버튼
  Widget downloadButton(BuildContext context, WidgetRef ref) {
    final detailVM = ref.read(detailContractViewModelProvider.notifier);

    return _ctaButton(
      context,
      ref,
      text: "거래 계약서 다운로드",
      onTap: () async {
        // PDF 공유/저장
        final success = await detailVM.downloadPdf();
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(detailContractViewModelProvider);
          showErrorToast(context, state.error!);
          detailVM.clearError();
        }
      },
    );
  }

  /// 이어서 작성 버튼
  Widget writeButton(BuildContext context, WidgetRef ref) {
    final detailState = ref.read(detailContractViewModelProvider);
    final createVM = ref.read(createContractViewModelProvider.notifier);

    return _ctaButton(
      context,
      ref,
      text: "이어서 작성하기",
      onTap: () async {
        createVM.loadFromDraft(
          publicCode: detailState.publicCode,
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

        context.push(AppRoutes.contractCreate);
      },
    );
  }

  /// 취소 버튼
  Widget cancelButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    return _ctaButton(
      context,
      ref,
      monoStyle: true,
      text: "취소하기",
      disabled: disabled,
      onTap: () async {
        showCustomBottomSheet(context, const ContractCancelBottomSheet());
      },
    );
  }

  /// 서명 버튼
  Widget signButton(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);

    return _ctaButton(
      context,
      ref,
      text: "서명하기",
      onTap: () async {
        // 1. 수신자 서명할 때
        if (detailState.status == ContractStatus.shared) {
          context.push(AppRoutes.requestDetail);
          // 2. 최종 서명할 때
        } else if (detailState.status == ContractStatus.receiverSigned) {
          context.push(AppRoutes.finalPreview);
          // 3. 그 외 X
        } else {
          return;
        }
      },
    );
  }

  Widget _ctaButton(
    BuildContext context,
    WidgetRef ref, {
    required String text,
    required Future<void> Function() onTap,
    bool disabled = false,
    bool monoStyle = false,
  }) {
    final detailState = ref.watch(detailContractViewModelProvider);

    Future<void> guardedOnTap() async {
      if (isPending.value) return;
      isPending.value = true;
      try {
        await onTap();
      } finally {
        isPending.value = false;
      }
    }

    if (monoStyle) {
      return PrimaryButton.mono(
        text: text,
        disabled: disabled,
        onTap: guardedOnTap,
      );
    }

    return PrimaryButton(
      text: text,
      disabled: disabled,
      onTap: guardedOnTap,
      backgroundColor: detailState.status.statusColor(context),
      foregroundColor: fxc(context).textBrand,
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
