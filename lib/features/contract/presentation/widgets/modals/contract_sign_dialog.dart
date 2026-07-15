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
    final detailState = ref.watch(detailContractViewModelProvider);
    final signVM = ref.read(signContractViewModelProvider.notifier);

    final hasSignature = useState(false);
    final signatureKey = useMemoized(() => GlobalKey<SfSignaturePadState>());
    final canSubmit = hasSignature.value;
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
                Text(
                  "전자 서명 및 최종확인",
                  style: context.txt(
                    color: vrc(context).textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),

                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: DottedBorder(
                    options: RectDottedBorderOptions(
                      dashPattern: [6, 4],
                      strokeWidth: 1.5,
                      color: vrc(context).borderSecondary!,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
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
                          // 다시 그리기 버튼
                          // 서명이 있을 때만 출력
                          if (hasSignature.value)
                            Positioned(
                              top: 8,
                              right: 8,
                              child: GestureDetector(
                                onTap: () {
                                  signatureKey.currentState?.clear();
                                  hasSignature.value = false;
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      CooliconsIcon.redo,
                                      size: 14,
                                      color: vrc(context).textTertiary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "다시 그리기",
                                      style: context.txt(
                                        color: vrc(context).textTertiary,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
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
                        disabled: !detailState.canCancel,
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
                            signVM.getSignature(signature);

                            final success = detailState.isCreator
                                // 요청자일 때 > 최종 서명
                                ? await signVM.creatorSign(
                                    detailState.publicCode,
                                  )
                                // 수신자일 때 > 수신자 서명
                                : await signVM.receiverSign(
                                    detailState.publicCode,
                                  );
                            if (!context.mounted) return;
                            if (!success) {
                              final state = ref.read(
                                signContractViewModelProvider,
                              );
                              showErrorToast(context, state.error!);
                              signVM.clearError();
                              return;
                            }

                            Navigator.of(context).pop();
                            if (parentContext != null &&
                                parentContext!.mounted) {
                              showCustomBottomSheet(
                                parentContext!,
                                detailState.isCreator
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

// class _Warning extends StatelessWidget {
//   const _Warning({required this.title, required this.content});

//   final String title;
//   final String content;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: fxc(context).opacityError,
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(CooliconsIcon.triangleWarning, color: fxc(context).iconDanger),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: context.txt(
//                       color: fxc(context).textDanger,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Text(
//                     content,
//                     style: context.txt(
//                       color: fxc(context).textDanger,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
