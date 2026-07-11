import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/inquiry_list_item.dart';
import 'package:trana/features/profile/presentation/viewmodels/inquiry_view_model.dart';

class InquiryHistoryPage extends HookConsumerWidget {
  const InquiryHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inquiryState = ref.watch(inquiryViewModelProvider);
    final inquiryVM = ref.read(inquiryViewModelProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        inquiryVM.readInquiries();
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "문의 내역 관리",
        onTapLeading: () => context.pop(),
      ),
      body: inquiryState.inquiries.isEmpty
          ? Center(child: Text("문의 내역이 없어요"))
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: inquiryState.inquiries.length,
              itemBuilder: (_, i) =>
                  InquiryListItem(i: inquiryState.inquiries[i]),
            ),
    );
  }
}
