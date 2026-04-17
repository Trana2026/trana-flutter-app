import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';

class BiometricLockPage extends HookConsumerWidget {
  const BiometricLockPage({super.key});

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
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: fxc(context).subtitleGreen,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.shield_outlined,
                  size: 52,
                  color: fxc(context).iconBrand,
                ),
              ),
              const SizedBox(height: 35),

              Text(
                "보안 문서",
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 20,
                  fontFamily: "PretendardBold"
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "이 계약서에는 민감한 개인정보가 포함되어 있습니다.\n내용을 보려면 인증이 필요해요.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: vrc(context).textSecondary,
                  fontSize: 14,
                  fontFamily: "PretendardMedium"
                ),
              ),
              const SizedBox(height: 35),

              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16), 
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: vrc(context).secondaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "생체 인증으로 잠금 해제",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: vrc(context).textPrimary,
                      fontSize: 18,
                      fontFamily: "PretendardSemiBold"
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
