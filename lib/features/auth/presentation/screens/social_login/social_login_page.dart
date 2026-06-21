import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/auth/presentation/screens/social_login/widgets/social_login_button.dart';
import 'package:trana/features/auth/presentation/viewmodels/social_login_view_model.dart';

/// 미성년자 소셜 로그인 화면 (카카오/구글/애플)
class SocialLoginPage extends HookConsumerWidget {
  const SocialLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);

    // 카카오 로그인
    Future<void> onKakaoTap() async {
      if (isLoading.value) return;
      isLoading.value = true;
      await ref.read(socialLoginViewModelProvider.notifier).signInWithKakao();
      isLoading.value = false;
      if (!context.mounted) return;
      context.go(AppRoutes.home);
    }

    // 구글 로그인
    Future<void> onGoogleTap() async {
      if (isLoading.value) return;
      isLoading.value = true;
      final result = await ref
          .read(socialLoginViewModelProvider.notifier)
          .signInWithGoogle();
      isLoading.value = false;
      if (!context.mounted) return;
      result.fold(
        onSuccess: (_) => context.go(AppRoutes.home),
        onFailure: (failure) => Fluttertoast.showToast(
          msg: failure.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: vrc(context).secondaryColor!,
          textColor: vrc(context).textPrimary!,
        ),
      );
    }

    // 애플 로그인
    Future<void> onAppleTap() async {
      if (isLoading.value) return;
      isLoading.value = true;
      final result = await ref
          .read(socialLoginViewModelProvider.notifier)
          .signInWithApple();
      isLoading.value = false;
      if (!context.mounted) return;
      result.fold(
        onSuccess: (_) => context.go(AppRoutes.home),
        onFailure: (failure) => Fluttertoast.showToast(
          msg: failure.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: vrc(context).secondaryColor!,
          textColor: vrc(context).textPrimary!,
        ),
      );
    }

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
                "사기 피해 없는 100% 안전 결제와\n검증된 판매자를 지금 만나보세요",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: vrc(context).textSecondary,
                  fontSize: 15,
                  fontFamily: "PretendardMedium",
                  height: 1.3,
                ),
              ),
              const Spacer(),

              Column(
                spacing: 5,
                children: [
                  SocialLoginButton(
                    onTap: onKakaoTap,
                    iconAsset: 'assets/images/Kakao.svg',
                    backgroundColor: const Color(0xFFFFE51C),
                    foregroundColor: const Color(0xFF1D2432),
                    title: "카카오톡으로 로그인하기",
                  ),
                  SocialLoginButton(
                    onTap: onGoogleTap,
                    iconAsset: 'assets/images/Google.svg',
                    backgroundColor: const Color(0xFFFFFFFF),
                    foregroundColor: const Color(0xFF1D2432),
                    title: "구글로 로그인하기",
                  ),
                  SocialLoginButton(
                    onTap: onAppleTap,
                    iconAsset: 'assets/images/Apple.svg',
                    backgroundColor: const Color(0xFFF9FAFB),
                    foregroundColor: const Color(0xFF111827),
                    title: "Apple로 로그인하기",
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                "로그인에 문제가 있나요?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: vrc(context).textTertiary,
                  fontSize: 13,
                  fontFamily: "PretendardMedium",
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
