import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_dialog.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/data/services/biometric_service.dart';

class BiometricLockPage extends HookConsumerWidget {
  const BiometricLockPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPending = useRef(false);
    final errorMessage = useState<String?>(null);

    Future<void> authenticate() async {
      if (isPending.value) return;
      isPending.value = true;
      errorMessage.value = null;
      try {
        final service = BiometricService();
        final canAuth = await service.canAuthenticate();
        if (!canAuth) {
          if (!context.mounted) return;
          await showCustomDialog(
            context: context,
            title: '계약 당사자만 열람해주세요',
            content: '이 계약서에는 민감한 개인정보가 포함되어 있어요.\n본인 외 타인이 열람하지 않도록 주의해주세요.',
            onConfirm: () async {
              if (context.mounted) {
                context.pushReplacement(AppRoutes.contractDetail);
              }
            },
          );
          return;
        }

        final success = await service.authenticate();
        if (!context.mounted) return;

        if (success) {
          context.pushReplacement(AppRoutes.contractDetail);
        } else {
          errorMessage.value = '인증에 실패했습니다. 다시 시도해주세요.';
        }
      } finally {
        isPending.value = false;
      }
    }

    // 페이지 진입 시 자동으로 생체 인증 실행
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => authenticate());
      return null;
    }, const []);

    // 인증 실패 시 토스트
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (errorMessage.value != null) {
          showErrorToast(context, errorMessage.value!);
        }
      });
      return null;
    }, [errorMessage.value]);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        backgroundColor: vrc(context).background,
        toolbarHeight: 56,
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.go(AppRoutes.home),
          child: Icon(
            CooliconsIcon.chevronLeft,
            color: vrc(context).textPrimary,
            size: 24,
          ),
        ),
      ),
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
                  color: fxc(context).opacitySuccess,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Icon(
                  Icons.shield_outlined,
                  size: 52,
                  color: fxc(context).iconBrand,
                ),
              ),
              const SizedBox(height: 33),
              Text(
                "보안 문서",
                style: context.txt(
                  color: vrc(context).textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "이 계약서에는 민감한 개인정보가 포함되어 있습니다.\n내용을 보려면 인증이 필요해요.",
                textAlign: TextAlign.center,
                style: context.txt(),
              ),
              const SizedBox(height: 39),
              InkWell(
                onTap: authenticate,
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
                    style: context.txt(
                      color: vrc(context).textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
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
