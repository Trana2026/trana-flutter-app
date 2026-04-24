import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; 
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/presentation/screens/select_role/select_user_role_page.dart';
import 'package:trana/core/widgets/consent_check_box.dart';
import 'package:trana/core/widgets/primary_button.dart';

class AiAutofillNoticeDialog extends HookConsumerWidget { 
  const AiAutofillNoticeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    final isSelected = useState(false);

    return Dialog(
      backgroundColor: vrc(context).background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(17, 20, 17, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: fxc(context).subtitleBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.info_outline_rounded,
                color: fxc(context).iconInfo,
                size: 22,
              ),
            ),
            const SizedBox(height: 12),

            Text(
              "계약 생성 시작",
              style: TextStyle(
                color: vrc(context).textPrimary,
                fontSize: 18,
                fontFamily: "PretendardBold"
              ),
            ),
            const SizedBox(height: 1),
            Text(
              "[AI 자동기입 고지]",
              style: TextStyle(
                color: vrc(context).textSecondary,
                fontSize: 13,
                fontFamily: "PretendardMedium"
              ),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: vrc(context).secondaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "꼭 확인하세요",
                      style: TextStyle(
                        color: vrc(context).textPrimary,
                        fontSize: 15,
                        fontFamily: "PretendardBold"
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: vrc(context).textSecondary,
                          fontSize: 13,
                          fontFamily: "PretendardMedium",
                          height: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text: "AI는 계약서 템플릿의 빈칸을 자동으로 입력할 뿐,",
                            style: TextStyle(color: vrc(context).textSecondary),
                          ),
                          TextSpan(
                            text: " 법률 판단이나 계약의 적합성 판단은 수행하지 않습니다.",
                            style: TextStyle(color: vrc(context).textSecondary),
                          ),
                          TextSpan(
                            text: " 자동기입 결과는 참고용이며, 최종 확인과 책임은 사용자에게 있습니다.\n",
                            style: TextStyle(color: vrc(context).textSecondary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 7),

            ConsentCheckbox(
              requiredText: "[필수]",
              descriptionText: " AI 자동기입 기능의 한계를 확인하고\n이해했으며, 동의합니다.",
              onChanged: (value) {
                isSelected.value = value; // 훅 상태 업데이트
              },
            ),

            const SizedBox(height: 7),

            InkWell(
              onTap: () {},
              child: Text(
                "AI 자동기입 고지 전문 보기",
                style: TextStyle(
                  color: vrc(context).textTertiary,
                  fontSize: 13,
                  fontFamily: "PretendardRegular"
                ),
              ),
            ),

            const SizedBox(height: 15),

            PrimaryButton(
              text: "확인",
              onTap: isSelected.value
                  ? () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectUserRolePage(),
                        ),
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
          ],
        ),
      ),
    );
  }
}