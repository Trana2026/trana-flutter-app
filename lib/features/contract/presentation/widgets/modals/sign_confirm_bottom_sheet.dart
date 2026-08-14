import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/constants/app_durations.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/minor_disclosure_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/sign_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/counter_party_info.dart';
import 'package:trana/features/contract/presentation/widgets/modals/contract_sign_dialog.dart';

class SignConfirmBottomSheet extends HookConsumerWidget {
  final BuildContext parentContext;

  const SignConfirmBottomSheet({super.key, required this.parentContext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (counterpartyIsMinor, canCancel) = ref.watch(
      detailContractViewModelProvider.select(
        (s) => (s.counterpartyIsMinor, s.canCancel),
      ),
    );
    final disclosureText = ref.watch(
      minorDisclosureViewModelProvider.select((s) => s.disclosureText),
    );
    final isChecked = useState<bool>(false);
    final isPending = useState(false);

    useEffect(() {
      // modal_viewed: 서명 확인 바텀시트
      AnalyticsService.trackScreenView('sign_confirm_modal');
      return null;
    }, const []);

    final isEnabled = counterpartyIsMinor ? isChecked.value : true;

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
        child: SafeArea(
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

              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CounterPartyInfo(),
                      const SizedBox(height: 10),

                      _ConfirmWarning(
                        appIcon: AppIcon.data(
                          icon: CooliconsIcon.circleWarning,
                        ),
                        title: "꼭 확인하세요",
                        content:
                            "전자서명을 완료하면 이 계약은 법적 효력이 발생하며, 서명 후에는 계약 내용을 수정하거나 삭제할 수 없습니다.",
                      ),

                      if (counterpartyIsMinor && disclosureText != null) ...[
                        const SizedBox(height: 10),
                        _ConfirmWarning(
                          appIcon: AppIcon.data(
                            icon: CooliconsIcon.triangleWarning,
                          ),
                          title: disclosureText.title,
                          titleColor: fxc(context).textDanger,
                          content: disclosureText.items.join('\n\n'),
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
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: PrimaryButton.mono(
                      text: '계약 취소하기',
                      disabled: !canCancel,
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
                          if (counterpartyIsMinor) {
                            // 미성년자 위험 고지 확인 (상대가 미성년자일 때)
                            final disclosureVM = ref.read(
                              minorDisclosureViewModelProvider.notifier,
                            );
                            final success = await disclosureVM.confirm(
                              ref
                                  .read(detailContractViewModelProvider)
                                  .publicCode,
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
                          final signVM = ref.read(
                            signContractViewModelProvider.notifier,
                          );
                          signVM.reset();

                          // 서명 필수 약관 조회 후 동의
                          final termsLoaded = await signVM.loadRequiredTerms();
                          if (!context.mounted) return;
                          if (!termsLoaded) {
                            final state = ref.read(
                              signContractViewModelProvider,
                            );
                            showErrorToast(context, state.error!);
                            signVM.clearError();
                            return;
                          }

                          // EVT-046: contract_sign_started
                          final detailState = ref.read(
                            detailContractViewModelProvider,
                          );
                          AnalyticsService.track(
                            'contract_sign_started',
                            properties: {
                              'contract_id': detailState.publicCode,
                              'actor_role': detailState.isCreator
                                  ? 'creator'
                                  : 'receiver',
                              'signature_stage':
                                  detailState.status ==
                                      ContractStatus.receiverSigned
                                  ? 'final'
                                  : 'receiver',
                              'contract_status': detailState.status.name,
                            },
                          );

                          Navigator.pop(context);
                          await Future.delayed(AppDurations.toggle);
                          if (!parentContext.mounted) return;
                          await showDialog<void>(
                            barrierColor: const Color(
                              0xFF000000,
                            ).withValues(alpha: 0.85),
                            context: parentContext,
                            builder: (context) => ContractSignDialog(
                              parentContext: parentContext,
                            ),
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
      ),
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
            duration: AppDurations.toggle,
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
