import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';

class ContractCompletionBottomSheet extends HookConsumerWidget {
  const ContractCompletionBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createState = ref.watch(createContractViewModelProvider);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 36, 20, 10),
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: fxc(context).subtitleGreen,
              shape: BoxShape.circle,
            ),
            child: Icon(
              CooliconsIcon.check,
              color: fxc(context).brandColor,
              size: 40,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "계약서 초안 생성을 완료했어요!",
            style: context.txt(
              color: vrc(context).textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: PrimaryButton.mono(
                  text: "홈으로 돌아가기",
                  onTap: () {
                    Navigator.of(context).popUntil(
                      (route) =>
                          route is! MaterialPageRoute &&
                          route is! ModalBottomSheetRoute,
                    );
                    context.go(AppRoutes.home);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PrimaryButton.brand(
                  text: "요청하기",
                  onTap: () async {
                    Navigator.of(context).popUntil(
                      (route) =>
                          route is! MaterialPageRoute &&
                          route is! ModalBottomSheetRoute,
                    );
                    context.go(
                      AppRoutes.contractShare,
                      extra: createState.publicCode,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
