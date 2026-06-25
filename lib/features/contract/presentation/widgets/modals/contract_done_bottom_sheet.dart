import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/primary_button.dart';

class ContractDoneBottomSheet extends HookConsumerWidget {
  const ContractDoneBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 36, 20, 10),
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
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: fxc(context).opacitySuccess,
                shape: BoxShape.circle,
              ),
              child: Icon(
                CooliconsIcon.check,
                color: fxc(context).brandColor,
                size: 36,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "계약서 생성 완료",
              style: context.txt(
                color: vrc(context).textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text("모든 서명이 완료되었습니다", style: context.txt(fontSize: 12)),
            const SizedBox(height: 32),
            Column(
              children: [
                PrimaryButton(
                  text: "계약서 확인하기",
                  onTap: () {
                    Navigator.pop(context);
                    context.go(AppRoutes.contractDetail);
                  },
                  backgroundColor: fxc(context).brandColor!,
                  foregroundColor: fxc(context).textBrand!,
                ),
                const SizedBox(height: 8),
                PrimaryButton(
                  text: "홈으로 돌아가기",
                  onTap: () {
                    Navigator.pop(context);
                    context.go(AppRoutes.home);
                  },
                  backgroundColor: vrc(context).secondaryColor!,
                  foregroundColor: vrc(context).textPrimary!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
