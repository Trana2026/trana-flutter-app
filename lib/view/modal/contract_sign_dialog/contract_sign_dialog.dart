import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; 
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/contract_share_page/contract_share_page.dart';
import 'package:trana/widgets/consent_check_box.dart';
import 'package:trana/widgets/primary_button.dart';

class ContractSignDialog extends HookConsumerWidget { 
  const ContractSignDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    final isSelected = useState(false);
    
    final signatureKey = useMemoized(() => GlobalKey<SfSignaturePadState>());

    return Dialog(
      backgroundColor: vrc(context).background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(17, 20, 17, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "전자 서명 및 최종확인",
              style: TextStyle(
                color: vrc(context).textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: fxc(context).subtitleError,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 2.5),
                          child: Icon(
                            Icons.warning_amber_rounded,
                            color: Color(0xFFFF6467),
                          ),
                        ),
                        SizedBox(width: 3.5),
                        Text(
                          "꼭 확인하세요",
                          style: TextStyle(
                            color: Color(0xFFEF4444),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Color(0xFFEF4444),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                        children: [
                          TextSpan(text: "전자서명 완료 시 본 계약은 법적 효력이 발생할 수 있으며,"),
                          TextSpan(text: " 서명 후에는 계약 내용을 수정하거나 삭제할 수 없습니다."),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: DottedBorder(
                options: const RectDottedBorderOptions(
                  dashPattern: [6, 4],
                  strokeWidth: 13,
                  color: Color(0xFFD1D5DB),
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
            const SizedBox(height: 12),

            ConsentCheckbox(
              requiredText: "[필수]",
              descriptionText: " 위 내용을 확인하고 이해했으며,\n전자서명에 동의합니다",
              onChanged: (value) {
                isSelected.value = value;
              },
            ),
            const SizedBox(height: 7),

            InkWell(
              onTap: () {},
              child: Text(
                "전자서명 및 기록 관련 전문 보기",
                style: TextStyle(
                  color: vrc(context).textTertiary,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: "취소",
                    onTap: () => Navigator.pop(context),
                    backgroundColor: vrc(context).secondaryColor!,
                    foregroundColor: vrc(context).textPrimary!,
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: PrimaryButton(
                    text: "완료",
                    onTap: isSelected.value
                        ? () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContractSharePage(),
                              ),
                              (route) => route.isFirst,
                            );
                          }
                        : null,
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