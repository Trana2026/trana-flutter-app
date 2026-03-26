import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/home_page/home_page.dart';
import 'package:trana/view/modal/sign_confirm_bottom_sheet/sign_confirm_bottom_sheet.dart';
import 'package:trana/widgets/primary_button.dart';

class ContractCompletionBottomSheet extends HookConsumerWidget { 
  final BuildContext parentContext;
  const ContractCompletionBottomSheet({super.key, required this.parentContext});

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
              color: fxc(context).subtitleGreen,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: fxc(context).brandColor, size: 36),
          ),
          const SizedBox(height: 13),

          Text(
            "계약서 초안 생성을 완료했어요!",
            style: TextStyle(
              color: vrc(context).textPrimary,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 40),

          Row(
            children: [
              Expanded(
                child: PrimaryButton(
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
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PrimaryButton(
                  text: "요청하기",
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: parentContext,
                      barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (bottomSheetContext) => SignConfirmBottomSheet(
                        parentContext: parentContext,
                      ),
                    );
                  },
                  backgroundColor: fxc(context).brandColor!,
                  foregroundColor: fxc(context).textBrand!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}