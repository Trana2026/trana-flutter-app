import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_bottom_sheet.dart';
import 'package:trana/core/widgets/custom_dialog.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/create_page_mode.dart';
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
    final reportIsMine = ref.watch(
      reportContractViewModelProvider.select((s) => s.recentReportIsMine),
    );
    final cancelIsMine = ref.watch(
      cancelContractViewModelProvider.select((s) => s.recentCancelIsMine),
    );
    final revisionDone = ref.watch(
      revisionRequestViewModelProvider.select((s) => s.revisionDone),
    );
    final (status, isCreator, isSeller, canCancel) = ref.watch(
      detailContractViewModelProvider.select(
        (s) => (s.status, s.isCreator, s.isSeller, s.canCancel),
      ),
    );

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
                secondary: cancelButton(context, ref, disabled: !canCancel),
              ),
      // 수정 요청
      ContractStatus.revisionRequested =>
        isCreator
            ? _CtaButtonRow(
                primary: requestSignButton(
                  context,
                  ref,
                  disabled: !revisionDone,
                ),
              )
            : _CtaButtonRow(
                primary: requestSignButton(context, ref, disabled: true),
              ),
      // 최종 서명 요청
      ContractStatus.receiverSigned =>
        isCreator
            ? _CtaButtonRow(
                secondary: cancelButton(context, ref, disabled: !canCancel),
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
        primary: cancelReportButton(context, ref, disabled: !reportIsMine),
      ),
      // 취소
      ContractStatus.cancelRequested || ContractStatus.cancelled =>
        cancelIsMine
            ? _CtaButtonRow(primary: cancelRequestButton(context, ref))
            : _CtaButtonRow(primary: confirmCancelButton(context, ref)),
      // 거래 완료
      ContractStatus.completed => _CtaButtonRow(
        secondary: reportButton(context, ref),
        primary: downloadButton(context, ref),
      ),
      // 기간 만료
      ContractStatus.expired => const SizedBox.shrink(),
    };
  }

  /// 삭제 버튼
  Widget deleteButton(
    BuildContext context,
    WidgetRef ref, {
    bool disabled = false,
  }) {
    final DetailContractState(:status, :publicCode) = ref.read(
      detailContractViewModelProvider,
    );

    return _ctaButton(
      context,
      ref,
      monoStyle: true,
      text: "삭제하기",
      disabled: disabled,
      onTap: () async {
        await showCustomDialog(
          context: context,
          title: '삭제 안내',
          content: '초안을 삭제하시겠어요?\n삭제하면 작성한 내용이 모두 사라져요',
          confirmText: '삭제',
          confirmColor: fxc(context).statusDraft,
          onConfirm: () async {
            if (status == ContractStatus.ready) {
              // READY > DRAFT 계약 상태 되돌림
              final detailVM = ref.read(
                detailContractViewModelProvider.notifier,
              );
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
            final deleteVM = ref.read(deleteContractViewModelProvider.notifier);
            final success = await deleteVM.deleteDraft(publicCode);
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
    final publicCode = ref.read(detailContractViewModelProvider).publicCode;

    return _ctaButton(
      context,
      ref,
      monoStyle: true,
      text: "신고 취소하기",
      disabled: disabled,
      onTap: () async {
        await showCustomDialog(
          context: context,
          title: "신고 취소 안내",
          content: "취소하면 접수된 신고 내용이 삭제되고\n삭제된 신고는 복구할 수 없어요",
          onConfirm: () async {
            // 신고 취소
            final reportVM = ref.read(reportContractViewModelProvider.notifier);
            final success = await reportVM.cancelReport(publicCode);
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
    final publicCode = ref.read(detailContractViewModelProvider).publicCode;

    return _ctaButton(
      context,
      ref,
      monoStyle: true,
      text: "요청 취소하기",
      disabled: disabled,
      onTap: () async {
        await showCustomDialog(
          context: context,
          title: "취소 안내",
          content: "취소하면 계약이 원래 상태로 돌아가고\n상대방에게도 알림이 전송돼요",
          onConfirm: () async {
            // 취소 요청 취소
            final cancelVM = ref.read(cancelContractViewModelProvider.notifier);
            final success = await cancelVM.revokeCancel(publicCode);
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
    final publicCode = ref.read(detailContractViewModelProvider).publicCode;

    return _ctaButton(
      context,
      ref,
      monoStyle: true,
      text: "취소 내용 확인하기",
      disabled: disabled,
      onTap: () async {
        // 취소 요청 내용 조회
        final cancelVM = ref.read(cancelContractViewModelProvider.notifier);
        final success = await cancelVM.readCancel(publicCode);
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
    final DetailContractState(:status, :publicCode) = ref.read(
      detailContractViewModelProvider,
    );

    return _ctaButton(
      context,
      ref,
      text: "서명 요청하기",
      disabled: disabled,
      onTap: () async {
        // 1. 수정 요청 상태일 때
        if (status == ContractStatus.revisionRequested) {
          await showCustomDialog(
            context: context,
            title: "서명 요청 안내",
            content: "수정한 계약 내용이 맞는지 확인해주세요\n요청 후에는 내용을 수정할 수 없어요",
            onConfirm: () async {
              // 재서명 요청
              final shareVM = ref.read(shareContractViewModelProvider.notifier);
              final success = await shareVM.reshare(publicCode);
              if (!context.mounted) return;
              if (!success) {
                final state = ref.read(shareContractViewModelProvider);
                showErrorToast(context, state.error!);
                shareVM.clearError();
                return;
              }

              // 수정 완료 > 요청 상태 초기화
              final revisionVM = ref.read(
                revisionRequestViewModelProvider.notifier,
              );
              revisionVM.revisionDone(false);
            },
          );

          // 2. 계약서 초안 상태일 때
        } else {
          context.push(AppRoutes.contractShare, extra: publicCode);
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
    final publicCode = ref.read(detailContractViewModelProvider).publicCode;

    return _ctaButton(
      context,
      ref,
      text: "거래 완료 확정",
      disabled: disabled,
      onTap: () async {
        await showCustomDialog(
          context: context,
          title: '거래 완료 안내',
          content: '확정하시면 이 거래는 완료 처리돼요\n(판매자 보증은 확정 후 3일간 진행)',
          onConfirm: () async {
            // 거래 완료
            final completeVM = ref.read(
              completeContractViewModelProvider.notifier,
            );
            final success = await completeVM.complete(publicCode);
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
    return _ctaButton(
      context,
      ref,
      text: "거래 계약서 다운로드",
      onTap: () async {
        // PDF 공유/저장
        final detailVM = ref.read(detailContractViewModelProvider.notifier);
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

    return _ctaButton(
      context,
      ref,
      text: "이어서 작성하기",
      onTap: () async {
        final createVM = ref.read(createContractViewModelProvider.notifier);
        createVM.setCreatePageMode(CreatePageMode.continueMode);

        createVM.loadFromDraft(
          publicCode: detailState.publicCode,
          deliveryType: detailState.deliveryType,
          role: detailState.myRole,
          attachmentIds: detailState.attachmentIds,
          existingAttachmentUrls: detailState.attachmentImageUrls,
          tradingPlatform: detailState.tradingPlatform,
          title: detailState.title,
          price: detailState.price,
          conditionSummary: detailState.conditionSummary,
          conditionDetails: detailState.conditionDetails,
          warrantyPeriodDays: detailState.warrantyPeriodDays,
        );

        // EVT-031: contract_draft_resumed
        final createdAt = detailState.createdAt;
        AnalyticsService.track(
          'contract_draft_resumed',
          properties: {
            'contract_id': detailState.publicCode,
            'entry_point': 'contract_detail',
            if (createdAt != null)
              'draft_age_minutes': DateTime.now()
                  .difference(createdAt)
                  .inMinutes,
          },
          ga4: false,
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
    final status = ref.read(detailContractViewModelProvider).status;

    return _ctaButton(
      context,
      ref,
      text: "서명하기",
      onTap: () async {
        // 1. 수신자 서명할 때
        if (status == ContractStatus.shared) {
          context.push(AppRoutes.requestDetail);
          // 2. 최종 서명할 때
        } else if (status == ContractStatus.receiverSigned) {
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
    final status = ref.watch(
      detailContractViewModelProvider.select((s) => s.status),
    );

    Future<void> guardedOnTap() async {
      if (isPending.value) return;
      isPending.value = true;
      try {
        await onTap();
      } finally {
        if (context.mounted) isPending.value = false;
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
      backgroundColor: status.statusColor(context),
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
