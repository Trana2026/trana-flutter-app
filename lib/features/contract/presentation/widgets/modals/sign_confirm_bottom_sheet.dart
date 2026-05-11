import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/presentation/widgets/modals/contract_sign_dialog.dart';
import 'package:trana/core/widgets/consent_check_box.dart';
import 'package:trana/core/widgets/primary_button.dart';

class SignConfirmBottomSheet extends HookConsumerWidget {
  final BuildContext parentContext;
  final String? contractId;
  final VoidCallback? onProceed;

  const SignConfirmBottomSheet({
    super.key,
    required this.parentContext,
    this.contractId,
    this.onProceed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkedStates = useState<List<bool>>([false, false, false, false]);

    final bool allChecked = checkedStates.value.every((e) => e);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),
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
          Center(
            child: Container(
              width: 110,
              height: 4,
              decoration: BoxDecoration(
                color: vrc(context).disableColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),

          ConsentCheckbox(
            descriptionText: "판매자의 설명을 충분히 확인했으며,\n해당 조건으로 거래를 진행함에 동의합니다.",
            onChanged: (value) {
              final newList = [...checkedStates.value];
              newList[0] = value;
              checkedStates.value = newList;
            },
          ),
          const SizedBox(height: 8),

          ConsentCheckbox(
            descriptionText:
                "계약 확정 이후에는 서로의 합의없이 내용을 변경하거나,\n일방적으로 취소하기 어렵다는 점을 인지합니다.",
            onChanged: (value) {
              final newList = [...checkedStates.value];
              newList[1] = value;
              checkedStates.value = newList;
            },
          ),
          const SizedBox(height: 8),

          ConsentCheckbox(
            descriptionText:
                "보증 및 환불 조건은 계약서에 기재된 내용에 따르며,\n그 이행은 거래 당사자 간의 책임임을 확인합니다.",
            onChanged: (value) {
              final newList = [...checkedStates.value];
              newList[2] = value;
              checkedStates.value = newList;
            },
          ),
          const SizedBox(height: 8),

          ConsentCheckbox(
            descriptionText:
                "본 문서는 당사자 간 합의 내용을 기록한 문서이며,\n거래는 서로의 신뢰를 바탕으로 진행됨에 동의합니다.",
            onChanged: (value) {
              final newList = [...checkedStates.value];
              newList[3] = value;
              checkedStates.value = newList;
            },
          ),

          const SizedBox(height: 20),

          PrimaryButton(
            text: "사인하기",
            onTap: allChecked
                ? () async {
                    bool dialogCompleted = false;
                    final router = GoRouter.of(context);
                    onProceed?.call();
                    Navigator.pop(context);
                    await Future.delayed(const Duration(milliseconds: 200));
                    if (!parentContext.mounted) return;
                    await showDialog<void>(
                      barrierColor: const Color(0xFF000000).withValues(alpha: 0.85),
                      context: parentContext,
                      builder: (ctx) => ContractSignDialog(
                        contractId: contractId,
                        onCompleted: onProceed != null ? () => dialogCompleted = true : null,
                        parentContext: onProceed != null ? parentContext : null,
                      ),
                    );
                    if (onProceed != null && !dialogCompleted && parentContext.mounted) {
                      Navigator.of(parentContext).popUntil(
                        (route) => route is! MaterialPageRoute && route is! ModalBottomSheetRoute,
                      );
                      router.go(AppRoutes.home);
                    }
                  }
                : null,
            backgroundColor: allChecked
                ? fxc(context).brandColor!
                : vrc(context).disableColor!,
            foregroundColor: allChecked
                ? fxc(context).textBrand!
                : vrc(context).textDisable!,
          ),
        ],
      ),
    );
  }
}
