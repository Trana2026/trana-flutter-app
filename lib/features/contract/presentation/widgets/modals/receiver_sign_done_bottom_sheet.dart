import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/primary_button.dart';

class ReceiverSignDoneBottomSheet extends HookConsumerWidget {
  const ReceiverSignDoneBottomSheet({super.key});

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
                Icons.check,
                color: fxc(context).brandColor,
                size: 36,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "전자서명을 완료했어요!",
              style: context.txt(
                color: vrc(context).textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "계약 생성자에게 서명 요청을 보내 최종 계약서를 생성하세요!",
              style: context.txt(
                color: vrc(context).textSecondary,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              text: "최종 서명 요청하기",
              onTap: () {
                Navigator.pop(context);
                context.go(AppRoutes.contractDetail);
              },
              backgroundColor: fxc(context).brandColor!,
              foregroundColor: fxc(context).textBrand!,
            ),
          ],
        ),
      ),
    );
  }
}
