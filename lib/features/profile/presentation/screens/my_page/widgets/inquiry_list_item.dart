import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/utils/date_time_extensions.dart';
import 'package:trana/core/widgets/custom_bottom_sheet.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/profile/domain/entities/user_inquiry_entity.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/modals/inquiry_detail_bottom_sheet.dart';
import 'package:trana/features/profile/presentation/viewmodels/inquiry_view_model.dart';

class InquiryListItem extends HookConsumerWidget {
  const InquiryListItem({super.key, required this.i});

  final UserInquiryEntity i;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        // 문의 상세 내용 조회
        final inquiryVM = ref.read(inquiryViewModelProvider.notifier);
        final success = await inquiryVM.readInquiryDetail(i.publicCode);
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(inquiryViewModelProvider);
          showErrorToast(context, state.error!);
          inquiryVM.clearError();
          return;
        }

        showCustomBottomSheet(context, const InquiryDetailBottomSheet());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: vrc(context).secondaryColor,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                i.title,
                style: context.txt(
                  color: vrc(context).textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                i.createdAt.toDotFormat,
                style: context.txt(
                  color: vrc(context).textTertiary,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
