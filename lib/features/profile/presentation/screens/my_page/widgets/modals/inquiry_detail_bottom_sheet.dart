import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/profile/presentation/viewmodels/inquiry_view_model.dart';

class InquiryDetailBottomSheet extends HookConsumerWidget {
  const InquiryDetailBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inquiryState = ref.watch(inquiryViewModelProvider);

    final titleCtr = useTextEditingController(
      text: inquiryState.selectedInquiryDetail?.title,
    );
    final contentCtr = useTextEditingController(
      text: inquiryState.selectedInquiryDetail?.content,
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 145,
                height: 4,
                decoration: BoxDecoration(
                  color: vrc(context).disableColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: fxc(context).borderOP,
                  ),
                  child: AppIcon.data(icon: CooliconsIcon.circleHelp, size: 18),
                ),
                const SizedBox(width: 12),
                Text(
                  "문의 내역",
                  style: context.txt(
                    color: vrc(context).textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            ContractFormField(
              label: "문의 제목",
              hintText: '제목을 입력해주세요',
              controller: titleCtr,
              readOnly: true,
            ),
            const SizedBox(height: 20),
            ContractFormField(
              label: "상세 내용",
              hintText: '문제를 자세히 설명해 주세요.',
              controller: contentCtr,
              maxLines: 4,
              readOnly: true,
            ),
            const SizedBox(height: 20),

            PrimaryButton(
              text: "완료",
              onTap: () => context.pop(),
              backgroundColor: fxc(context).brandColor!,
              foregroundColor: fxc(context).textBrand!,
            ),
          ],
        ),
      ),
    );
  }
}
