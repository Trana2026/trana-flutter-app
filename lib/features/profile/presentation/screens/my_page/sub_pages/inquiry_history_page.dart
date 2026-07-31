import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/inquiry_list_item.dart';
import 'package:trana/features/profile/presentation/viewmodels/inquiry_view_model.dart';

class InquiryHistoryPage extends HookConsumerWidget {
  const InquiryHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inquiries = ref.watch(
      inquiryViewModelProvider.select((s) => s.inquiries),
    );

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // 문의 전체 목록 조회
        final inquiryVM = ref.read(inquiryViewModelProvider.notifier);
        final success = await inquiryVM.readInquiries();
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(inquiryViewModelProvider);
          showErrorToast(context, state.error!);
          inquiryVM.clearError();
        }
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "문의 내역 관리",
        onTapLeading: () => context.pop(),
      ),
      body: inquiries.isEmpty
          ? Center(child: Text("문의 내역이 없어요"))
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: inquiries.length,
              itemBuilder: (_, i) => InquiryListItem(i: inquiries[i]),
            ),
    );
  }
}
