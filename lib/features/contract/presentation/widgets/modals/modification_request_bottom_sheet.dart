import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/primary_button.dart';

class ModificationRequestBottomSheet extends HookConsumerWidget {
  final BuildContext parentContext;
  final VoidCallback? onProceed;

  const ModificationRequestBottomSheet({
    super.key,
    required this.parentContext,
    this.onProceed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

          ContractFormField(label: '거래 물품명', hintText: '수정을 원하시는 이유를 작성해주세요'),
          const SizedBox(height: 8),

          ContractFormField(label: '금액', hintText: '수정을 원하시는 이유를 작성해주세요'),
          const SizedBox(height: 8),

          PrimaryButton(
            text: "수정 요청하기",
            onTap: () {},
            backgroundColor: fxc(context).brandColor!,
            foregroundColor: fxc(context).textBrand!,
          ),
        ],
      ),
    );
  }
}
