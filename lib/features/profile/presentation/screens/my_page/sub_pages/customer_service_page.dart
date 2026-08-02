import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/utils/validation.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/profile/presentation/viewmodels/inquiry_view_model.dart';

class CustomerServicePage extends HookConsumerWidget {
  const CustomerServicePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailCtr = useTextEditingController();
    final titleCtr = useTextEditingController();
    final contentCtr = useTextEditingController();
    final emailError = useState<String?>(null);
    final isPending = useState(false);

    useListenable(emailCtr);
    useListenable(titleCtr);
    useListenable(contentCtr);

    final isEnabled =
        emailCtr.text.trim().isNotEmpty &&
        titleCtr.text.trim().isNotEmpty &&
        contentCtr.text.trim().isNotEmpty;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "고객센터",
        onTapLeading: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ContractFormField(
                label: "이메일",
                hintText: "답변 받으실 이메일 주소를 입력해주세요",
                keyboardType: TextInputType.emailAddress,
                controller: emailCtr,
                errorText: emailError.value,
                onChanged: (v) => emailError.value = null,
              ),
              const SizedBox(height: 12),
              ContractFormField(
                label: "문의 제목",
                hintText: "제목을 입력해주세요",
                controller: titleCtr,
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
              ),
              const SizedBox(height: 12),
              ContractFormField(
                label: "문의 내용",
                hintText: "문의할 내용을 작성해주세요",
                controller: contentCtr,
                minLines: 6,
                maxLines: null,
                inputFormatters: [LengthLimitingTextInputFormatter(2000)],
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: vrc(context).secondaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "문의 전 확인해주세요",
                      style: context.txt(
                        color: vrc(context).textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const _NoticeText(
                      text:
                          "처리에 2~3일 정도 소요됩니다.\n문의 접수 후 기재해주신 이메일로 답변이 발송됩니다.\n욕설·비방 등 부적절한 문의는 답변이 제한될 수 있습니다.\n",
                    ),
                    const _NoticeText(
                      text:
                          "운영 시간은 평일 09:00~18:00이며, 주말·공휴일은 처리가 지연될 수 있습니다.\n",
                    ),
                    const _NoticeText(
                      text:
                          "긴급 신고는 고객센터보다 경찰청 사이버범죄 신고(ecrm.police.go.kr)를 이용해 주세요.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: PrimaryButton.brand(
            text: "문의하기",
            disabled: !isEnabled,
            onTap: () async {
              if (isPending.value) return;
              isPending.value = true;
              try {
                emailError.value = Validation.email(emailCtr.text);
                if (emailError.value != null) return;

                final inquiryVM = ref.read(inquiryViewModelProvider.notifier);
                inquiryVM.updateEntries(
                  email: emailCtr.text,
                  title: titleCtr.text,
                  content: contentCtr.text,
                );

                // 문의 작성
                final success = await inquiryVM.createInquiry();
                if (!context.mounted) return;
                if (!success) {
                  final state = ref.read(inquiryViewModelProvider);
                  showErrorToast(context, state.error!);
                  inquiryVM.clearError();
                  return;
                }

                context.pop();
                context.push(AppRoutes.inquiryHistory);
              } finally {
                isPending.value = false;
              }
            },
          ),
        ),
      ),
    );
  }
}

class _NoticeText extends StatelessWidget {
  const _NoticeText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("  •  ", style: context.txt(color: vrc(context).textTertiary)),
        Expanded(
          child: Text(
            text,
            style: context.txt(color: vrc(context).textTertiary),
          ),
        ),
      ],
    );
  }
}
