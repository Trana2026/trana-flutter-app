// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:trana/core/router/app_router.dart';
// import 'package:trana/core/theme/app_text_style.dart';
// import 'package:trana/core/theme/app_theme.dart';
// import 'package:trana/core/theme/coolicons_icon.dart';
// import 'package:trana/core/widgets/app_icon.dart';
// import 'package:trana/core/widgets/custom_toast.dart';
// import 'package:trana/core/widgets/primary_button.dart';
// import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
// import 'package:trana/features/contract/presentation/viewmodels/delete_contract_view_model.dart';
// import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
// import 'package:trana/features/contract/presentation/viewmodels/guardian_link_view_model.dart';
// import 'package:trana/features/contract/presentation/widgets/modals/guardian_selection_card.dart';

// class GuardianConsentSignDialog extends HookConsumerWidget {
//   const GuardianConsentSignDialog({super.key, required this.isCreator});

//   final bool isCreator;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final createState = ref.watch(createContractViewModelProvider);
//     final createVM = ref.read(createContractViewModelProvider.notifier);
//     final guardianState = ref.watch(guardianLinkViewModelProvider);
//     final guardianVM = ref.read(guardianLinkViewModelProvider.notifier);
//     final detailState = ref.watch(detailContractViewModelProvider);
//     final deleteVM = ref.read(deleteContractViewModelProvider.notifier);

//     final selectedIndex = useState<int?>(null);
//     final phase = useState(0); // 0: 선택, 1: 인증 진행 중, 2: 인증 완료
//     final bool isAnySelected = selectedIndex.value != null;
//     final publicCode = isCreator
//         ? createState.publicCode
//         : detailState.publicCode;

//     useEffect(() {
//       if (phase.value != 1) return null;
//       final timer = Timer.periodic(const Duration(seconds: 3), (t) async {
//         final approved = await guardianVM.checkConsentApproved(publicCode);
//         if (approved) {
//           t.cancel();
//           phase.value = 2;
//         }
//       });
//       return timer.cancel;
//     }, [phase.value]);

//     useEffect(() {
//       if (phase.value != 2) return null;
//       final timer = Timer(const Duration(seconds: 3), () {
//         Navigator.pop(context);
//         context.push(AppRoutes.selectRole);
//       });
//       return timer.cancel;
//     }, [phase.value]);

//     useEffect(() {
//       WidgetsBinding.instance.addPostFrameCallback((_) async {
//         // 요청자일 때, 계약 생성 먼저
//         if (isCreator) {
//           final success = await createVM.createDraft();
//           if (!context.mounted) return;
//           if (!success) {
//             final state = ref.read(createContractViewModelProvider);
//             showErrorToast(context, state.error!);
//             createVM.clearError();
//           }
//         }

//         // 보호자 동의 링크 생성
//         final linkSuccess = isCreator
//             ? await guardianVM.getCreatorGuardianLink(publicCode)
//             : await guardianVM.getReceiverGuardianLink(publicCode);
//         if (!context.mounted) return;
//         if (!linkSuccess) {
//           final state = ref.read(guardianLinkViewModelProvider);
//           showErrorToast(context, state.error!);
//           guardianVM.clearError();
//           return;
//         }
//       });
//       return null;
//     }, []);

//     return Dialog(
//       backgroundColor: vrc(context).background,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//       child: Container(
//         width: 340,
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: fxc(context).subtitleBlue,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 Icons.shield_outlined,
//                 color: fxc(context).iconInfo,
//                 size: 24,
//               ),
//             ),
//             const SizedBox(height: 12),

//             if (phase.value == 0) ...[
//               Text(
//                 "계약 방식을 선택해 주세요",
//                 style: context.txt(
//                   color: vrc(context).textPrimary,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               GuardianSelectionCard(
//                 title: "법정대리인에게 동의 요청",
//                 subtitle: "완전한 법적 효력이 발생합니다(권장)",
//                 icon: CooliconsIcon.circleCheck,
//                 isSelected: selectedIndex.value == 0,
//                 activeColor: fxc(context).brandColor!,
//                 activeBgColor: fxc(context).subtitleGreen!,
//                 onTap: () => selectedIndex.value = 0,
//               ),
//               const SizedBox(height: 12),

//               if (selectedIndex.value == 0) ...[
//                 Row(
//                   children: [
//                     Expanded(
//                       flex: 8,
//                       child: Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 14,
//                           vertical: 16,
//                         ),
//                         decoration: BoxDecoration(
//                           color: vrc(context).secondaryColor,
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Text(
//                           guardianState.verifyUrl ?? '',
//                           style: context.txt(
//                             color: vrc(context).textPrimary,
//                             fontWeight: FontWeight.w400,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     InkWell(
//                       borderRadius: BorderRadius.circular(20),
//                       onTap: () {
//                         Clipboard.setData(
//                           ClipboardData(text: guardianState.verifyUrl ?? ''),
//                         );
//                         showNormalToast(context, "링크가 복사되었습니다", null);
//                       },
//                       child: Container(
//                         height: 52,
//                         width: 52,
//                         decoration: BoxDecoration(
//                           color: vrc(context).secondaryColor,
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Center(
//                           child: AppIcon.svg(
//                             asset: 'assets/icons/copy.svg',
//                             color: fxc(context).brandColor!,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//               ],

//               GuardianSelectionCard(
//                 title: "동의 없이 진행",
//                 subtitle: "효력이 제한되며 상대방에게 표시됩니다",
//                 icon: Icons.warning_amber_rounded,
//                 isSelected: selectedIndex.value == 1,
//                 iconDisabled: selectedIndex.value != 1,
//                 activeColor: fxc(context).iconDanger!,
//                 activeBgColor: fxc(context).subtitleError!,
//                 onTap: () => selectedIndex.value = 1,
//               ),
//               const SizedBox(height: 12),
//               PrimaryButton.brand(
//                 text: "확인",
//                 disabled: !isAnySelected,
//                 onTap: () async {
//                   if (selectedIndex.value == 0) {
//                     phase.value = 1;
//                   } else {
//                     Navigator.pop(context);

//                     isCreator
//                         ? context.go(AppRoutes.selectRole)
//                         : context.go(AppRoutes.requestDetail);
//                   }
//                 },
//               ),
//             ] else if (phase.value == 1) ...[
//               Text(
//                 "인증이 진행 중입니다",
//                 style: context.txt(
//                   color: vrc(context).textPrimary,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 "보호자분께서 본인 인증을 진행하고 있어요.\n완료되면 알림을 보내드릴게요.",
//                 textAlign: TextAlign.center,
//                 style: context.txt(),
//               ),
//               const SizedBox(height: 12),
//               SizedBox(
//                 height: 120,
//                 width: 300,
//                 child: Center(
//                   child: CircularProgressIndicator(
//                     color: fxc(context).brandColor,
//                     strokeWidth: 3,
//                   ),
//                 ),
//               ),
//             ] else ...[
//               Text(
//                 "인증 완료!",
//                 style: context.txt(
//                   color: vrc(context).textPrimary,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 "이제 법정대리인의 동의 하에\n안전하게 계약을 생성할 수 있어요.",
//                 textAlign: TextAlign.center,
//                 style: context.txt(),
//               ),
//               const SizedBox(height: 12),
//               SizedBox(
//                 height: 120,
//                 width: 300,
//                 child: Center(
//                   child: Container(
//                     height: 40,
//                     width: 40,
//                     decoration: BoxDecoration(
//                       color: fxc(context).subtitleGreen,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       CooliconsIcon.check,
//                       color: fxc(context).iconBrand,
//                       size: 24,
//                     ),
//                   ),
//                 ),
//               ),
//             ],

//             const SizedBox(height: 12),
//             InkWell(
//               onTap: () async {
//                 if (createState.publicCode != null) {
//                   final success = await deleteVM.deleteDraft(
//                     createState.publicCode!,
//                   );
//                   if (!context.mounted) return;
//                   if (!success) {
//                     final state = ref.read(deleteContractViewModelProvider);
//                     showErrorToast(context, state.error!);
//                     deleteVM.clearError();
//                     return;
//                   }
//                 }

//                 context.pop();
//               },
//               child: Text(
//                 "취소하고 돌아가기",
//                 style: context.txt(
//                   color: vrc(context).textTertiary,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
