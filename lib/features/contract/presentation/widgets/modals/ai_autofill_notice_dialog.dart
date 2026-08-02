import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/ai_auto_fill_view_model.dart';
import 'package:trana/features/terms/domain/enums/terms_type.dart';

class AiAutofillNoticeDialog extends HookConsumerWidget {
  const AiAutofillNoticeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingAnalysis = ref.watch(
      aiAutoFillViewModelProvider.select((s) => s.isLoadingAnalysis),
    );
    final autoFillConsentedAt = ref
        .read(aiAutoFillViewModelProvider)
        .autoFillConsentedAt;
    final isSelected = useState(false);

    return PopScope(
      // AI 분석 진행 중에는 바깥 탭/뒤로가기로 dialog를 닫을 수 없도록 차단
      canPop: !isLoadingAnalysis,
      child: Dialog(
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

              SingleChildScrollView(
                child: Column(
                  children: [
                    _NoticeCard(
                      appIcon: AppIcon.data(
                        icon: CooliconsIcon.info,
                        color: vrc(context).iconSecondary,
                      ),
                      title: "꼭 확인하세요",
                      content:
                          "AI는 계약서 템플릿의 빈칸을 자동으로 입력할 뿐, 법률 판단이나 계약의 적합성 판단은 수행하지 않습니다. 자동기입 결과는 참고용이며, 최종 확인과 책임은 사용자에게 있습니다.",
                    ),
                    const SizedBox(height: 10),

                    _NoticeCard(
                      appIcon: AppIcon.data(
                        icon: CooliconsIcon.triangleWarning,
                        color: fxc(context).iconDanger,
                      ),
                      title: "이런 이미지는 올리지 마세요",
                      content: "신분증, 여권, 운전면허증, 카드번호, 계좌번호가 보이는 이미지",
                    ),
                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: vrc(context).secondaryColor,
                      ),
                      child: Column(
                        children: [
                          _ConsentItem(
                            onSelected: (v) => isSelected.value = v,
                            isRequired: true,
                            text: 'AI 자동 기입 기능 국외이전 동의',
                            onTapChevron: () => context.push(
                              AppRoutes.termsDetail,
                              extra: TermsType.aiCrossBorder,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _ConsentItem(
                            text: 'AI 자동 기입 고지 전문 보기',
                            onTapChevron: () => context.push(
                              AppRoutes.termsDetail,
                              extra: TermsType.aiAutofillNotice,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              PrimaryButton.brand(
                text: isLoadingAnalysis ? "이미지를 분석 중이에요..." : "분석하기",
                disabled: !isSelected.value,
                onTap: () async {
                  if (isLoadingAnalysis) return;

                  final aiVM = ref.read(aiAutoFillViewModelProvider.notifier);
                  if (autoFillConsentedAt == null) {
                    aiVM.consentAutoFill();
                  }

                  // AI 이미지 분석
                  final success = await aiVM.analyzeImages();
                  if (!context.mounted) return;
                  if (!success) {
                    final state = ref.read(aiAutoFillViewModelProvider);
                    showErrorToast(context, state.error ?? '이미지 분석에 실패했습니다.');
                    aiVM.clearError();
                    return;
                  }

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoticeCard extends StatelessWidget {
  const _NoticeCard({
    required this.appIcon,
    required this.title,
    required this.content,
  });

  final AppIcon appIcon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: vrc(context).tertiaryColor,
                ),
                child: appIcon.copyWith(size: 15),
              ),
              const SizedBox(width: 7),
              Text(
                title,
                style: context.txt(
                  color: vrc(context).textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(content, style: context.txt(fontSize: 12)),
        ],
      ),
    );
  }
}

class _ConsentItem extends HookConsumerWidget {
  const _ConsentItem({
    this.onSelected,
    this.isRequired = false,
    required this.text,
    this.onTapChevron,
  });

  final ValueChanged<bool>? onSelected;
  final bool isRequired;
  final String text;
  final void Function()? onTapChevron;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = useState(false);

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              isSelected.value = !isSelected.value;
              onSelected?.call(isSelected.value);
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                if (onSelected != null) ...[
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: isSelected.value
                          ? fxc(context).brandColor
                          : vrc(context).background,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: isSelected.value
                            ? Colors.transparent
                            : vrc(context).textDisable!,
                      ),
                    ),
                    child: isSelected.value
                        ? Center(
                            child: Icon(
                              Icons.done,
                              size: 16,
                              color: fxc(context).textBrand,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(width: 8),
                ],

                if (isRequired)
                  Text(
                    '[필수] ',
                    style: context.txt(color: fxc(context).textInfo),
                  ),
                Expanded(
                  child: Text(
                    text,
                    style: context.txt(color: vrc(context).textPrimary),
                  ),
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: onTapChevron,
          behavior: HitTestBehavior.opaque,
          child: AppIcon.data(icon: CooliconsIcon.chevronRight, size: 16),
        ),
      ],
    );
  }
}
