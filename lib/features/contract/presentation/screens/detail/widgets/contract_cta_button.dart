import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_dialog.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_report_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/delete_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/modify_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/guardian_consent_sign_dialog.dart';

class ContractCtaButtons extends HookConsumerWidget {
  const ContractCtaButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);

    final status = detailState.status;

    return switch (status) {
      ContractStatus.inProgress || ContractStatus.draft => _CtaButtonRow(
        secondary: deleteButton(context, ref),
        primary: writeButton(context, ref),
      ),
      ContractStatus.ready => _CtaButtonRow(
        secondary: deleteButton(context, ref),
        primary: requestSignButton(context, ref),
      ),
      ContractStatus.shared => _CtaButtonRow(
        primary: _ContractCtaButton(
          disabled: true,
          text: "거래 완료 확정",
          onTap: () {},
        ),
      ),
      ContractStatus.revisionRequested => _CtaButtonRow(
        primary: requestSignButton(context, ref),
      ),

      ContractStatus.receiverSigned => _CtaButtonRow(
        secondary: cancelButton(context),
        primary: signButton(context),
      ),
      ContractStatus.cancelRequested ||
      ContractStatus.cancelled => _CtaButtonRow(primary: cancelButton(context)),

      ContractStatus.signed => _CtaButtonRow(
        secondary: reportButton(context),
        primary: completeButton(context, ref),
      ),
      ContractStatus.completed => _CtaButtonRow(
        secondary: reportButton(context),
        primary: downloadButton(context, ref),
      ),
    };
  }

  Widget deleteButton(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    final deleteVM = ref.read(deleteContractViewModelProvider.notifier);

    return _ContractCtaButton(
      disabled: true,
      text: "삭제하기",
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => CustomDialog(
            title: '삭제 안내',
            content: '삭제하시겠습니까?',
            confirmText: '삭제하기',
            onConfirm: () async {
              if (detailState.status == ContractStatus.ready) {
                await detailVM.revert();
              }

              final success = await deleteVM.deleteDraft(
                detailState.publicCode,
              );
              if (!context.mounted) return;
              if (!success) {
                showErrorToast(
                  context,
                  ref.read(deleteContractViewModelProvider).error!,
                );
                deleteVM.clearError();
                return;
              }

              context.go(AppRoutes.home);
            },
          ),
        );
      },
    );
  }

  Widget reportButton(BuildContext context) {
    return _ContractCtaButton(
      disabled: true,
      text: "문제 신고",
      onTap: () {
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

  Widget requestSignButton(BuildContext context, WidgetRef ref) {
    final detailState = ref.read(detailContractViewModelProvider);

    return _ContractCtaButton(
      disabled: false,
      text: "서명 요청하기",
      onTap: () {
        context.push(AppRoutes.contractShare, extra: detailState.publicCode);
      },
    );
  }

  Widget completeButton(BuildContext context, WidgetRef ref) {
    return _ContractCtaButton(disabled: false, text: "거래 완료 확정", onTap: () {});
  }

  Widget downloadButton(BuildContext context, WidgetRef ref) {
    return _ContractCtaButton(
      disabled: false,
      text: "거래 계약서 다운로드",
      onTap: () {},
    );
  }

  Widget writeButton(BuildContext context, WidgetRef ref) {
    final detailState = ref.read(detailContractViewModelProvider);
    final modifyVM = ref.read(modifyContractViewModelProvider.notifier);

    return _ContractCtaButton(
      disabled: false,
      text: "이어서 작성하기",
      onTap: () {
        modifyVM.loadFromDraft(
          publicCode: detailState.publicCode,
          consentType: detailState.consentType,
          deliveryType: detailState.deliveryType,
          role: detailState.myRole,
          attachmentIds: detailState.attachmentIds,
          existingAttachmentUrls: detailState.attachmentImageUrls,
          title: detailState.title ?? '',
          price: detailState.price ?? 0,
          conditionSummary: detailState.conditionSummary ?? '',
          conditionDetails: detailState.conditionDetails ?? '',
          warranted: detailState.warrantyPeriodDays != 0, // TODO : 백엔드 구현되면 반영
        );

        switch (ref.read(modifyContractViewModelProvider).consentType) {
          case null:
            return;
          case ConsentType.notApplicable:
            detailState.myRole == null
                ? context.push(AppRoutes.modifySelectRole)
                : context.push(AppRoutes.contractCreate);
            return;
          case ConsentType.guardianRequired:
            showDialog(
              barrierColor: Colors.black.withValues(alpha: 0.75),
              context: context,
              builder: (context) => const GuardianConsentSignDialog(),
            );
            return;
        }
      },
    );
  }

  Widget cancelButton(BuildContext context) {
    return _ContractCtaButton(disabled: true, text: "취소하기", onTap: () {});
  }

  Widget signButton(BuildContext context) {
    return _ContractCtaButton(disabled: true, text: "서명하기", onTap: () {});
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
  final bool disabled;
  final String text;
  final VoidCallback onTap;

  const _ContractCtaButton({
    required this.disabled,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final status = detailState.status;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: disabled
              ? vrc(context).secondaryColor
              : status.statusColor(context),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: disabled ? vrc(context).textPrimary : fxc(context).textBrand,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            height: 1.5,
            letterSpacing: -0.2,
          ),
        ),
      ),
    );
  }
}
