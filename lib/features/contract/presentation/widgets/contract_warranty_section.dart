import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/modify_contract_view_model.dart';

class ContractWarrantySection extends HookConsumerWidget {
  const ContractWarrantySection({super.key, this.isModify = false});

  final bool isModify;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createVM = ref.read(createContractViewModelProvider.notifier);
    final modifyVM = ref.read(modifyContractViewModelProvider.notifier);

    final initialValue = isModify
        ? ref.read(modifyContractViewModelProvider).warranted
        : ref.read(createContractViewModelProvider).warranted;
    final isWarranted = useState<bool>(initialValue);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (isModify) {
          modifyVM.updateWarranted(isWarranted.value);
        } else {
          createVM.updateWarranted(isWarranted.value);
        }
      });
      return null;
    }, [isWarranted.value]);

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                "보증 기간",
                style: context.txt(
                  color: vrc(context).textTertiary,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Icon(CooliconsIcon.info, size: 14, color: vrc(context).iconDisable),
          ],
        ),
        const SizedBox(height: 6),
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => isWarranted.value = !isWarranted.value,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isWarranted.value
                    ? fxc(context).brandColor!
                    : Colors.transparent,
              ),
              color: isWarranted.value
                  ? fxc(context).opacitySuccess
                  : vrc(context).secondaryColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isWarranted.value
                        ? fxc(context).brandColor
                        : vrc(context).background,
                    border: Border.all(
                      color: isWarranted.value
                          ? fxc(context).brandColor!
                          : vrc(context).iconDisable!,
                    ),
                  ),
                  child: isWarranted.value
                      ? Icon(
                          CooliconsIcon.check,
                          color: fxc(context).textBrand,
                          size: 16,
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "보증 기간 3일",
                        style: context.txt(
                          color: isWarranted.value
                              ? fxc(context).brandColor
                              : vrc(context).textTertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "보증 기간을 제공하면 구매자의 신뢰도가 40% 증가합니다. 명확한 조건은 분쟁을 예방합니다.",
                        style: context.txt(
                          color: isWarranted.value
                              ? fxc(context).brandColor
                              : vrc(context).textDisable,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
