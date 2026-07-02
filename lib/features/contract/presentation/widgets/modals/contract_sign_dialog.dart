import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/consent_check_box.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/sign_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/contract_done_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/widgets/modals/receiver_sign_done_bottom_sheet.dart';

class ContractSignDialog extends HookConsumerWidget {
  final VoidCallback? onCompleted;
  final BuildContext? parentContext;

  const ContractSignDialog({super.key, this.onCompleted, this.parentContext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final signVM = ref.read(signContractViewModelProvider.notifier);

    final isSelected = useState(false);
    final signatureKey = useMemoized(() => GlobalKey<SfSignaturePadState>());

    return Dialog(
      backgroundColor: vrc(context).background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
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
            const SizedBox(height: 8),
            const _Warning(
              title: "꼭 확인하세요",
              content:
                  "전자서명 완료 시 본 계약은 법적 효력이 발생할 수 있으며, 서명 후에는 계약 내용을 수정하거나 삭제할 수 없습니다.",
            ),
            if (detailState.guardianNotConsented) ...[
              const SizedBox(height: 8),
              const _Warning(
                title: "꼭 확인하세요",
                content: "법정 대리인 인증을 안한 사람입니다. 그래도 계약을 생성하시겠습니까?",
              ),
            ],
            if (detailState.hasReportHistory) ...[
              const SizedBox(height: 8),
              const _Warning(
                title: "신고 이력이 있는 사용자입니다.",
                content: "본 사용자는 다수의 이용자로부터 문제 신고가 접수된 기록이 있습니다.",
              ),
            ],
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: DottedBorder(
                options: RectDottedBorderOptions(
                  dashPattern: [6, 4],
                  strokeWidth: 13,
                  color: vrc(context).borderSecondary!,
                ),
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: vrc(context).secondaryColor,
                  ),
                  child: SfSignaturePad(
                    key: signatureKey,
                    backgroundColor: Colors.transparent,
                    strokeColor: vrc(context).textPrimary,
                    minimumStrokeWidth: 2,
                    maximumStrokeWidth: 3,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ConsentCheckbox(
              requiredText: "[필수]",
              descriptionText: " 위 내용을 확인하고 이해했으며,\n전자서명에 동의합니다",
              onChanged: (value) {
                signVM.agreeElectronicSignatureTerm(value);
                isSelected.value = value;
              },
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {},
              child: Text(
                "전자서명 및 기록 관련 전문 보기",
                style: TextStyle(
                  color: vrc(context).textTertiary,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: -0.12,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: "취소",
                    onTap: () => context.pop(),
                    backgroundColor: vrc(context).secondaryColor!,
                    foregroundColor: vrc(context).textPrimary!,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PrimaryButton(
                    text: "완료",
                    onTap: () async {
                      if (!isSelected.value) return;

                      // TODO : 테스트용 (실제 전자서명 signature_pad PNG image 의 raw base64 로 변경하기)
                      signVM.getSignature('dGVzdA==');

                      // 생성자일 때 > 생성자 최종 서명
                      if (detailState.isCreator) {
                        final success = await signVM.creatorSign(
                          detailState.publicCode,
                        );
                        if (!context.mounted) return;
                        if (!success) {
                          final state = ref.read(signContractViewModelProvider);
                          showErrorToast(context, state.error!);
                          signVM.clearError();
                          return;
                        }
                        // 수신자일 때 > 수신자 서명
                      } else {
                        final success = await signVM.receiverSign(
                          detailState.publicCode,
                        );
                        if (!context.mounted) return;
                        if (!success) {
                          final state = ref.read(signContractViewModelProvider);
                          showErrorToast(context, state.error!);
                          signVM.clearError();
                          return;
                        }
                      }

                      onCompleted?.call();

                      Navigator.of(context).pop();
                      if (parentContext != null && parentContext!.mounted) {
                        showModalBottomSheet(
                          context: parentContext!,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (_) => detailState.isCreator
                              ? const ContractDoneBottomSheet()
                              : const ReceiverSignDoneBottomSheet(),
                        );
                      }
                    },
                    backgroundColor: isSelected.value
                        ? fxc(context).brandColor!
                        : vrc(context).disableColor!,
                    foregroundColor: isSelected.value
                        ? fxc(context).textBrand!
                        : vrc(context).textDisable!,
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

class _Warning extends StatelessWidget {
  const _Warning({required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: fxc(context).opacityError,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(CooliconsIcon.triangleWarning, color: fxc(context).iconDanger),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.txt(
                      color: fxc(context).textDanger,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    content,
                    style: context.txt(
                      color: fxc(context).textDanger,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
