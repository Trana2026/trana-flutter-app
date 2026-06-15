import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/consent_check_box.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/ai_auto_fill_view_model.dart';

class AiAutofillNoticeDialog extends HookConsumerWidget {
  const AiAutofillNoticeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aiState = ref.watch(aiAutoFillViewModelProvider);
    final aiVM = ref.read(aiAutoFillViewModelProvider.notifier);
    final isSelected = useState(false);

    return Dialog(
      backgroundColor: vrc(context).background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: fxc(context).subtitleBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                CooliconsIcon.info,
                color: fxc(context).iconInfo,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "[AI 자동기입 고지]",
              style: context.txt(
                color: vrc(context).textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: vrc(context).secondaryColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "꼭 확인하세요",
                    style: context.txt(
                      color: vrc(context).textPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "AI는 계약서 템플릿의 빈칸을 자동으로 입력할 뿐, 법률 판단이나 계약의 적합성 판단은 수행하지 않습니다. 자동기입 결과는 참고용이며, 최종 확인과 책임은 사용자에게 있습니다.",
                    style: context.txt(fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ConsentCheckbox(
              requiredText: "[필수]",
              descriptionText: " AI 자동기입 기능의 한계를 확인하고\n이해했으며, 동의합니다.",
              onChanged: (value) => isSelected.value = value,
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {},
              child: Text(
                "AI 자동기입 고지 전문 보기",
                style: TextStyle(
                  color: vrc(context).textTertiary,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: -0.12,
                  decoration: TextDecoration.underline,
                  decorationColor: vrc(context).textTertiary,
                ),
              ),
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              text: aiState.isLoading ? "이미지를 분석 중이에요..." : "분석하기",
              onTap: () async {
                if (!isSelected.value || aiState.isLoading) return;

                if (aiState.autoFillConsentedAt == null) {
                  aiVM.consentAutoFill();
                }

                final success = await aiVM.analyzeImages();
                if (!context.mounted) return;
                if (!success) {
                  showErrorToast(
                    context,
                    ref.read(aiAutoFillViewModelProvider).error ??
                        '이미지 분석에 실패했습니다.',
                  );
                  aiVM.clearError();
                  return;
                }

                Navigator.pop(context);
              },
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
