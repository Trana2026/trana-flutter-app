import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/contract_detail_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/sign_confirm_bottom_sheet.dart';

class ContractCompletionBottomSheet extends HookConsumerWidget {
  final BuildContext parentContext;

  const ContractCompletionBottomSheet({super.key, required this.parentContext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createState = ref.watch(createContractViewModelProvider);
    final detailVM = ref.read(contractDetailViewModelProvider.notifier);

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
              fontFamily: "PretendardBold",
            ),
          ),
          const SizedBox(height: 40),

          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  text: "홈으로 돌아가기",
                  onTap: () {
                    Navigator.of(context).popUntil(
                      (route) =>
                          route is! MaterialPageRoute &&
                          route is! ModalBottomSheetRoute,
                    );
                    context.go(AppRoutes.home);
                  },
                  backgroundColor: vrc(context).secondaryColor!,
                  foregroundColor: vrc(context).textPrimary!,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PrimaryButton(
                  text: "요청하기",
                  onTap: () async {
                    final contractId = createState.contractId;
                    if (contractId == null) return;

                    await detailVM.readSelectedContract(contractId);

                    if (!context.mounted) return;
                    bool signFlowProceeded = false;
                    final router = GoRouter.of(context);
                    Navigator.pop(context);
                    if (!parentContext.mounted) return;
                    await showModalBottomSheet<void>(
                      context: parentContext,
                      barrierColor: const Color(
                        0xFF000000,
                      ).withValues(alpha: 0.75),
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (_) => SignConfirmBottomSheet(
                        parentContext: parentContext,
                        onProceed: () => signFlowProceeded = true,
                      ),
                    );
                    if (!signFlowProceeded && parentContext.mounted) {
                      Navigator.of(parentContext).popUntil(
                        (route) =>
                            route is! MaterialPageRoute &&
                            route is! ModalBottomSheetRoute,
                      );
                      router.go(AppRoutes.home);
                    }
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
