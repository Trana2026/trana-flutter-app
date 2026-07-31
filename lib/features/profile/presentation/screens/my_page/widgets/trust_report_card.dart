import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/profile/presentation/viewmodels/my_page_view_model.dart';

class TrustReportCard extends HookConsumerWidget {
  const TrustReportCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (completed, warranted, reported) = ref.watch(
      myPageViewModelProvider.select(
        (s) => (
          s.completedContractCount,
          s.warrantyProvidedCount,
          s.fraudReportReceivedCount,
        ),
      ),
    );
    final items = [
      (label: "누적 계약 건수", length: completed),
      (label: "보증 횟수", length: warranted),
      (label: "분쟁 여부", length: reported),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final (index, item) in items.indexed) ...[
              if (index > 0) const _HorizontalDivider(),
              _CardItem(label: item.label, length: item.length),
            ],
          ],
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({required this.label, required this.length});

  final String label;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: context.txt(fontSize: 12, color: vrc(context).textTertiary),
          ),
          const SizedBox(height: 4),
          Text(
            "$length건",
            style: context.txt(
              color: vrc(context).textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _HorizontalDivider extends StatelessWidget {
  const _HorizontalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: vrc(context).borderPrimary,
    );
  }
}
