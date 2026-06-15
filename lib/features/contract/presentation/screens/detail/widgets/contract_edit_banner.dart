import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';

class ContractEditBanner extends HookConsumerWidget {
  const ContractEditBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 77,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: vrc(context).secondaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: vrc(context).tertiaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Icon(
                CooliconsIcon.editPencilLine01,
                color: vrc(context).iconPrimary,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                "계약서 수정하기",
                style: context.txt(
                  color: vrc(context).textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              CooliconsIcon.chevronRight,
              color: vrc(context).iconSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
