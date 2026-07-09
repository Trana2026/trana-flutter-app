import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';

class MyPageMenuItem extends HookConsumerWidget {
  final VoidCallback? onTap;
  final AppIcon appIcon;
  final String label;
  final Widget? customTrailing;
  final String trailingText;
  final bool showChevron;

  const MyPageMenuItem({
    super.key,
    this.onTap,
    required this.appIcon,
    required this.label,
    this.customTrailing,
    this.trailingText = '',
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: vrc(context).secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: appIcon.copyWith(size: 16),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: context.txt(
                  color: vrc(context).textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            ?customTrailing,

            if (customTrailing == null)
              Text(
                trailingText,
                style: context.txt(fontWeight: FontWeight.normal),
              ),

            if (customTrailing == null && showChevron)
              Icon(
                CooliconsIcon.caretRightSm,
                color: vrc(context).iconSecondary,
                size: 26,
              ),
          ],
        ),
      ),
    );
  }
}
