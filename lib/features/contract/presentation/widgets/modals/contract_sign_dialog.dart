import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_bottom_sheet.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/data/services/signature_export_service.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/sign_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/contract_done_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/widgets/modals/receiver_sign_done_bottom_sheet.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';

class ContractSignDialog extends HookConsumerWidget {
  final BuildContext? parentContext;

  const ContractSignDialog({super.key, this.parentContext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canCancel = ref.watch(
      detailContractViewModelProvider.select((s) => s.canCancel),
    );
    final DetailContractState(:publicCode, :isCreator) = ref.read(
      detailContractViewModelProvider,
    );
    final hasSignature = useState(false);
    final canSubmit = hasSignature.value;
    final signatureKey = useMemoized(() => GlobalKey<SfSignaturePadState>());
    final isPending = useState(false);

    final me = ref.read(meProvider).value;
    final isMinor = me?.ageGroup == 'MINOR';

    return Dialog(
      backgroundColor: vrc(context).background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: PendingOverlay(
        isPending: isPending.value,
        child: Padding(
          padding: const EdgeInsets.all(20),
          // 소형 화면 고려해서 스크롤 허용
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 다시 그리기 버튼
                    // 서명이 있을 때만 출력
                    hasSignature.value
                        ? InkWell(
                            onTap: () {
                              signatureKey.currentState?.clear();
                              hasSignature.value = false;
                            },
                            child: Icon(
                              CooliconsIcon.redo,
                              color: vrc(context).iconDisable,
                            ),
                          )
                        : const SizedBox(width: 24, height: 24),
                    Text(
                      "전자 서명 및 최종확인",
                      style: context.txt(
                        color: vrc(context).textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 24, height: 24),
                  ],
                ),
                const SizedBox(height: 12),

                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    radius: const Radius.circular(20),
                    dashPattern: [6, 4],
                    strokeWidth: 1.5,
                    color: vrc(context).borderSecondary!,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: vrc(context).secondaryColor,
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: SfSignaturePad(
                              key: signatureKey,
                              backgroundColor: Colors.transparent,
                              strokeColor: vrc(context).textPrimary,
                              minimumStrokeWidth: 2,
                              maximumStrokeWidth: 3,
                              onDrawStart: () {
                                hasSignature.value = true;
                                return false;
                              },
                            ),
                          ),
                          // 서명 전 안내 문구
                          // 서명이 화면에 없을때만 출력
                          if (!hasSignature.value)
                            Positioned.fill(
                              child: IgnorePointer(
                                child: Center(
                                  child: Text(
                                    "서명란 (터치하여 서명)",
                                    style: context.txt(
                                      color: vrc(context).textTertiary,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                if (isMinor) ...[
                  Text(
                    "계약이 체결되면 보호자에게 알림이 전송됩니다",
                    style: TextStyle(
                      color: vrc(context).textTertiary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      letterSpacing: -0.12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton.mono(
                        text: "취소",
                        disabled: !canCancel,
                        onTap: () => context.pop(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: PrimaryButton.brand(
                        text: "완료",
                        disabled: !canSubmit,
                        onTap: () async {
                          if (isPending.value) return;
                          isPending.value = true;
                          try {
                            final signature =
                                await SignatureExportService.export(
                                  signatureKey,
                                );
                            if (!context.mounted) return;
                            if (signature == null) {
                              showErrorToast(
                                context,
                                '서명 이미지 처리에 실패했어요. 다시 시도해주세요.',
                              );
                              return;
                            }
                            final signVM = ref.read(
                              signContractViewModelProvider.notifier,
                            );
                            signVM.getSignature(signature);

                            final success = isCreator
                                // 요청자일 때 > 최종 서명
                                ? await signVM.creatorSign(publicCode)
                                // 수신자일 때 > 수신자 서명
                                : await signVM.receiverSign(publicCode);
                            if (!context.mounted) return;
                            if (!success) {
                              final state = ref.read(
                                signContractViewModelProvider,
                              );
                              showErrorToast(context, state.error!);
                              signVM.clearError();
                              return;
                            }

                            Navigator.pop(context);

                            if (parentContext != null &&
                                parentContext!.mounted) {
                              showCustomBottomSheet(
                                parentContext!,
                                isCreator
                                    // 요청자일 때
                                    ? const ContractDoneBottomSheet()
                                    // 수신자일 때
                                    : const ReceiverSignDoneBottomSheet(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
