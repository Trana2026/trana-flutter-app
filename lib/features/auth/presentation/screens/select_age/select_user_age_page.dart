import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/auth/presentation/screens/id_card_camera/id_card_camera_page.dart';
import 'package:trana/features/auth/presentation/screens/social_login/social_login_page.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/core/widgets/select_role_card.dart';

class SelectUserAgePage extends HookConsumerWidget {
  const SelectUserAgePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int?>(null);
    final isEnabled = selectedIndex.value != null;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "본인 인증",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontFamily: "PretendardBold"
          ),
        ),
        backgroundColor: vrc(context).background,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                "연령 확인",
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 20,
                  fontFamily: "PretendardBold"
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "PretendardMedium",
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text: "계약의 법적 효력 확인을 위해 본인의 연령을 선택해주세요\n",
                    style: TextStyle(color: vrc(context).textSecondary),
                  ),
                  TextSpan(
                    text: "※ 미성년자는 계약 생성 시 법정대리인의 동의가 필요합니다",
                    style: TextStyle(
                      color: vrc(context).textTertiary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            SelectRoleCard(
              icon: Icons.person,
              title: "성인",
              description: "직접 계약서를 생성할 수 있어요.",
              isSelected: selectedIndex.value == 0,
              showIconBorder: true,
              onTap: () => selectedIndex.value = 0,
            ),
            const SizedBox(height: 10),

            SelectRoleCard(
              icon: Icons.person,
              title: "미성년자",
              description: "계약 생성 시 법적 대리인의 인증 절차가 필요해요.",
              isSelected: selectedIndex.value == 1,
              showIconBorder: true,
              onTap: () => selectedIndex.value = 1,
            ),

            const Spacer(),

            PrimaryButton(
              text: "다음",
              onTap: () {
                if (!isEnabled) return;
                if (selectedIndex.value == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IdCardCameraPage()),
                  );
                }
                if (selectedIndex.value == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SocialLoginPage()),
                  );
                }
              },
              backgroundColor: isEnabled
                  ? fxc(context).brandColor!
                  : vrc(context).disableColor!,
              foregroundColor: isEnabled
                  ? fxc(context).textBrand!
                  : vrc(context).textDisable!,
            ),
          ],
        ),
      ),
    );
  }
}