import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/home_page/home_page.dart';
import 'package:trana/view/onboarding/minor/social_login_page/widgets/social_login_button.dart';

class SocialLoginPage extends HookConsumerWidget { 
  const SocialLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    return Scaffold(
      backgroundColor: vrc(context).background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: fxc(context).brandColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.shield_outlined,
                  size: 35,
                  color: vrc(context).background,
                ),
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 35,
                    fontFamily: "PretendardBold",
                    height: 1.15,
                  ),
                  children: [
                    TextSpan(
                      text: "안전한 중고 거래 \n",
                      style: TextStyle(color: vrc(context).textPrimary),
                    ),
                    TextSpan(
                      text: "전자 계약 서비스",
                      style: TextStyle(color: vrc(context).textPrimary),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "법적 효력이 있는 계약서를 생성하고,\n본인인증을 완료하여 안전하게 거래하세요",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 15,
                  fontFamily: "PretendardMedium",
                  height: 1.15,
                ),
              ),
              const Spacer(),

              Column(
                spacing: 5,
                children: [
                  SocialLoginButton(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(showGuardianDialog: true),
                      ),
                    ),
                    backgroundColor: const Color(0xFFFFE51C),
                    foregroundColor: const Color(0xFF1D2432),
                    title: "카카오톡으로 로그인하기",
                  ),
                  SocialLoginButton(
                    onTap: () {},
                    backgroundColor: const Color(0xFFFFFFFF),
                    foregroundColor: const Color(0xFF1D2432),
                    title: "구글로 로그인하기",
                  ),
                  SocialLoginButton(
                    onTap: () {},
                    backgroundColor: const Color(0xFFF9FAFB),
                    foregroundColor: const Color(0xFF111827),
                    title: "Apple로 로그인하기",
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