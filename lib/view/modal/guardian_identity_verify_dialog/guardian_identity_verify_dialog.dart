import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/onboarding/minor/guardian_link_send_page/guardian_link_send_page.dart';
import 'package:trana/widgets/primary_button.dart';

class GuardianIdentityVerifyDialog extends HookConsumerWidget { 
  const GuardianIdentityVerifyDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    return Dialog(
      backgroundColor: vrc(context).background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(17, 20, 17, 17),
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
              "법정 대리인 인증 안내",
              style: TextStyle(
                color: vrc(context).textPrimary,
                fontSize: 18,
                fontFamily: "PretendardBold"
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
                padding: const EdgeInsets.all(15),
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
                    const SizedBox(height: 4), 
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: vrc(context).textSecondary,
                          fontSize: 13,
                          fontFamily: "PretendardMedium",
                          height: 1.2,
                        ),
                        children: [
                          const TextSpan(text: "사용자께서는 미성년자이기 때문에,"),
                          const TextSpan(text: " 계약이 법적 효력을 갖기 위해서는 법정대리인의 동의가 필요합니다."),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),

            PrimaryButton(
              text: "인증하기",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GuardianLinkSendPage(),
                  ),
                );
              },
              backgroundColor: fxc(context).brandColor!,
              foregroundColor: fxc(context).textBrand!,
            ),
            const SizedBox(height: 10),

            InkWell(
              onTap: () => Navigator.pop(context),
              child: Text(
                "취소하고 돌아가기",
                style: TextStyle(
                  color: vrc(context).textTertiary,
                  fontSize: 13,
                  fontFamily: "PretendardRegular"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}