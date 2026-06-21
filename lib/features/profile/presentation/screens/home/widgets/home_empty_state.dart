import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';

class HomeEmptyState extends HookConsumerWidget {
  const HomeEmptyState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: vrc(context).secondaryColor,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                CooliconsIcon.fileBlank,
                color: vrc(context).iconSecondary,
                size: 26,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              "아직 계약이 없습니다",
              style: context.txt(
                color: vrc(context).textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "첫 번째 안전 계약을 작성해보세요",
              style: context.txt(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
