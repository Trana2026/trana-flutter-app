import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
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

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (isPartyMinor) {
          // 미성년자 위험 고지 문구 조회 (상대가 미성년자일 때)
          final success = await disclosureVM.readText();
          if (!context.mounted) return;
          if (!success) {
            final state = ref.read(minorDisclosureViewModelProvider);
            showErrorToast(context, state.error!);
            disclosureVM.clearError();
          }
        }
      });
      return null;
    }, []);

    return PendingOverlay(
      isPending: isPending.value,
      child: Container(
        padding: const EdgeInsets.all(20),
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
                    _ConfirmTextCard(
                      title: "거래 상대방",
                      content:
                          "✓ 본인확인 ${detailState.counterpartyVerified ? '완료' : '미완료'}\n거래 ${detailState.counterpartyTradeCount}건 · 분쟁 ${detailState.counterpartyDisputeCount}건 · 확인된 신고 ${detailState.counterpartyConfirmedReportCount}건\n신뢰 점수 ${detailState.counterpartyTrustScore}점",
                    ),
                    const SizedBox(height: 10),

                    _ConfirmTextCard(
                      title: "꼭 확인하세요",
                      content:
                          "전자서명을 완료하면 이 계약은 법적 효력이 발생하며, 서명 후에는 계약 내용을 수정하거나 삭제할 수 없습니다.",
                    ),

                    if (isPartyMinor &&
                        disclosureState.disclosureText != null) ...[
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: vrc(context).secondaryColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              disclosureState.disclosureText!.title,
                              style: context.txt(
                                color: fxc(context).textDanger,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              disclosureState.disclosureText!.items.join(
                                '\n\n',
                              ),
                              style: context.txt(
                                color: vrc(context).textPrimary,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 24),
                            _ConsentCheckRow(
                              descriptionText: "위 내용을 모두 확인했습니다",
                              onChanged: (v) {
                                isChecked.value = v;
                              },
                            ),
                          ],
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
                        // 미성년자 위험 고지 확인
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
                        }

                        signVM.reset();
                        // 약관 동의
                        signVM.agreeContractAgreementTerm();
                        signVM.agreeElectronicSignatureTerm(true);

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

class _ConfirmTextCard extends StatelessWidget {
  const _ConfirmTextCard({required this.title, required this.content});

  final String title;
  final String content;

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
          Text(
            title,
            style: context.txt(
              color: vrc(context).textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: context.txt(color: vrc(context).textPrimary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

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
          const SizedBox(width: 10),
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
