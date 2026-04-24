import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/auth/presentation/screens/intro/widgets/intro_benefit_box.dart';
import 'package:trana/features/auth/presentation/screens/select_age/select_user_age_page.dart';
import 'package:trana/core/widgets/primary_button.dart';

class IntroPage extends HookConsumerWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: vrc(context).background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Container(
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
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                  ),
                  children: [
                    TextSpan(
                      text: "안전한 중고 거래\n",
                      style: TextStyle(
                        color: vrc(context).textPrimary,
                        fontFamily: "PretendardBold"
                      ),
                    ),
                    TextSpan(
                      text: "전자 계약 서비스",
                      style: TextStyle(
                        color: vrc(context).textPrimary,
                        fontFamily: "PretendardBold"
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Text(
                  "법적 효력이 있는 계약서를 생성하고,\n본인인증을 완료하여 안전하게 거래하세요",
                  style: TextStyle(
                    color: vrc(context).textPrimary,
                    fontSize: 15,
                    fontFamily: "PretendardMedium",
                    height: 1.15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const IntroBenefitBox(
                icon: Icons.edit_document,
                title: "간편 전자 서명",
                description: "빠르고 안전하며 법적 효력이 있습니다.",
              ),
              const SizedBox(height: 5),
              const IntroBenefitBox(
                icon: Icons.gavel,
                title: "분쟁 해결 지원",
                description: "계약 기반 증거 자료가 자동 생성됩니다.",
              ),
              const Spacer(),
              PrimaryButton(
                text: "본인 인증 시작하기",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectUserAgePage()),
                ),
                backgroundColor: fxc(context).brandColor!,
                foregroundColor: fxc(context).textBrand!,
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  "시작하면 서비스 이용약관에 동의하게 됩니다.",
                  style: TextStyle(
                    color: vrc(context).textSecondary,
                    fontSize: 12,
                    fontFamily: "PretendardBold"
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}