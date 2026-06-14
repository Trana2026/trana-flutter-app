import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/screens/detail/contract_detail_page.dart';
import 'package:trana/features/profile/presentation/screens/home/home_page.dart';

class ContractDoneBottomSheet extends HookConsumerWidget {
  const ContractDoneBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF00C950).withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: fxc(context).brandColor, size: 36),
          ),
          const SizedBox(height: 13),

          Text(
            "계약서 생성 완료",
            style: TextStyle(
              color: vrc(context).textPrimary,
              fontSize: 19,
              fontWeight: FontWeight.w700,
              height: 1.5,
              letterSpacing: -0.19,
            ),
          ),
          const SizedBox(height: 13),

          Text(
            "모든 서명이 완료되었습니다",
            style: TextStyle(
              color: vrc(context).textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.5,
              letterSpacing: -0.14,
            ),
          ),
          const SizedBox(height: 40),

          Column(
            children: [
              PrimaryButton(
                text: "계약서 확인하기",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContractDetailPage(),
                    ),
                    (route) => false,
                  );
                },
                backgroundColor: fxc(context).brandColor!,
                foregroundColor: fxc(context).textBrand!,
              ),
              const SizedBox(height: 8),

              PrimaryButton(
                text: "홈으로 돌아가기",
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false,
                  );
                },
                backgroundColor: vrc(context).secondaryColor!,
                foregroundColor: vrc(context).textPrimary!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
