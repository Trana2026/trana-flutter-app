import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/minor_disclosure_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/sign_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/contract_sign_dialog.dart';

class SignConfirmBottomSheet extends HookConsumerWidget {
  final BuildContext parentContext;

  const SignConfirmBottomSheet({super.key, required this.parentContext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signVM = ref.read(signContractViewModelProvider.notifier);
    final detailState = ref.watch(detailContractViewModelProvider);
    final disclosureState = ref.watch(minorDisclosureViewModelProvider);
    final disclosureVM = ref.read(minorDisclosureViewModelProvider.notifier);

    final isChecked = useState<bool>(false);
    final isPending = useState(false);

    // 거래 상대방이 미성년자인지 여부
    final isPartyMinor = detailState.counterpartyIsMinor;
    // 서명하기 버튼 활성화 여부 (거래 상대방이 미성년자이면 배너 체크 시에만 활성화, 아니면 항상 활성화)
    final isEnabled = isPartyMinor ? isChecked.value : true;

    return PendingOverlay(
      isPending: isPending.value,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        decoration: BoxDecoration(
          color: vrc(context).background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 145,
                height: 4,
                decoration: BoxDecoration(
                  color: vrc(context).disableColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              "확인 사항",
              style: context.txt(
                color: vrc(context).textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.6,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _ConfirmParty(),
                    const SizedBox(height: 10),

                    _ConfirmWarning(
                      appIcon: AppIcon.data(icon: CooliconsIcon.circleWarning),
                      title: "꼭 확인하세요",
                      content:
                          "전자서명을 완료하면 이 계약은 법적 효력이 발생하며, 서명 후에는 계약 내용을 수정하거나 삭제할 수 없습니다.",
                    ),

                    if (isPartyMinor &&
                        disclosureState.disclosureText != null) ...[
                      const SizedBox(height: 10),
                      _ConfirmWarning(
                        appIcon: AppIcon.data(
                          icon: CooliconsIcon.triangleWarning,
                        ),
                        title: disclosureState.disclosureText!.title,
                        titleColor: fxc(context).textDanger,
                        content: disclosureState.disclosureText!.items.join(
                          '\n\n',
                        ),
                        checkbox: _ConsentCheckRow(
                          descriptionText: "위 내용을 모두 확인했습니다",
                          onChanged: (v) {
                            isChecked.value = v;
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: PrimaryButton.mono(
                    text: '계약 취소하기',
                    disabled: !detailState.canCancel,
                    onTap: () {
                      Navigator.pop(context);
                      context.go(AppRoutes.contractDetail);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PrimaryButton.brand(
                    text: "사인하기",
                    disabled: !isEnabled,
                    onTap: () async {
                      if (isPending.value) return;
                      isPending.value = true;
                      try {
                        if (isPartyMinor) {
                          // 미성년자 위험 고지 확인 (상대가 미성년자일 때)
                          final success = await disclosureVM.confirm(
                            detailState.publicCode,
                          );
                          if (!context.mounted) return;
                          if (!success) {
                            final state = ref.read(
                              minorDisclosureViewModelProvider,
                            );
                            showErrorToast(context, state.error!);
                            disclosureVM.clearError();
                            return;
                          }
                        }

                        // 서명 플로우 시작 전에 이전 시도 초기화
                        signVM.reset();

                        // 전자 서명 약관 동의
                        signVM.agreeElectronicSignatureTerm();

                        Navigator.pop(context);
                        await Future.delayed(const Duration(milliseconds: 200));
                        if (!parentContext.mounted) return;
                        await showDialog<void>(
                          barrierColor: const Color(
                            0xFF000000,
                          ).withValues(alpha: 0.85),
                          context: parentContext,
                          builder: (context) =>
                              ContractSignDialog(parentContext: parentContext),
                        );
                      } finally {
                        if (context.mounted) isPending.value = false;
                      }
                    },
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

class _ConfirmParty extends HookConsumerWidget {
  const _ConfirmParty();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: vrc(context).tertiaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: AppIcon.data(
                  icon: CooliconsIcon.user02,
                  size: 18,
                  color: vrc(context).iconSecondary,
                ),
              ),
              const SizedBox(width: 7),
              Text(
                "거래 상대방",
                style: context.txt(
                  color: vrc(context).textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: fxc(context).opacitySuccess,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "${detailState.counterpartyTrustScore}점",
                  style: context.txt(
                    color: fxc(context).brandColor,
                    fontSize: 10,
                  ),
                ),
              ),
              const Spacer(),
              AppIcon.svg(
                asset:
                    "assets/icons/${detailState.counterpartyVerified ? 'shield_check' : 'shield'}.svg",
                size: 16,
                color: detailState.counterpartyVerified
                    ? fxc(context).brandColor
                    : vrc(context).tertiaryColor,
              ),
              const SizedBox(width: 2),
              Text(
                "본인 확인 ${detailState.counterpartyVerified ? '완료' : '미완료'}",
                style: context.txt(
                  color: fxc(context).brandColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              contractCount(
                context,
                label: '거래',
                count: detailState.counterpartyTradeCount,
              ),
              contractCount(
                context,
                label: '분쟁',
                count: detailState.counterpartyDisputeCount,
              ),
              contractCount(
                context,
                label: '확인된 신고',
                count: detailState.counterpartyConfirmedReportCount,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget contractCount(
    BuildContext context, {
    required String label,
    required int count,
  }) {
    return Row(
      children: [
        Text(
          label,
          style: context.txt(color: vrc(context).textTertiary, fontSize: 12),
        ),
        const SizedBox(width: 4),
        Text(
          "$count건",
          style: context.txt(
            color: vrc(context).textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}

class _ConfirmWarning extends StatelessWidget {
  const _ConfirmWarning({
    required this.appIcon,
    required this.title,
    this.titleColor,
    required this.content,
    this.checkbox,
  });

  final AppIcon appIcon;
  final String title;
  final Color? titleColor;
  final String content;
  final Widget? checkbox;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: vrc(context).tertiaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: appIcon.copyWith(
                  size: 18,
                  color: titleColor ?? vrc(context).iconSecondary,
                ),
              ),
              const SizedBox(width: 7),
              Text(
                title,
                style: context.txt(
                  color: titleColor ?? vrc(context).textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(content, style: context.txt(fontSize: 12)),
          if (checkbox != null) ...[const SizedBox(height: 24), checkbox!],
        ],
      ),
    );
  }
}

/// 약관 체크박스
class _ConsentCheckRow extends HookConsumerWidget {
  final String descriptionText;
  final ValueChanged<bool>? onChanged;

  const _ConsentCheckRow({
    required this.descriptionText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = useState(false);

    return GestureDetector(
      onTap: () {
        isSelected.value = !isSelected.value;
        onChanged?.call(isSelected.value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isSelected.value
                  ? fxc(context).brandColor
                  : vrc(context).background,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isSelected.value
                    ? Colors.transparent
                    : vrc(context).textDisable!,
                width: 1,
              ),
            ),
            child: isSelected.value
                ? Center(
                    child: Icon(
                      Icons.done,
                      size: 16,
                      color: fxc(context).textBrand,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 8),
          Text(
            "[필수] ",
            style: context.txt(
              color: fxc(context).textInfo,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              descriptionText,
              style: context.txt(color: vrc(context).textPrimary, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
