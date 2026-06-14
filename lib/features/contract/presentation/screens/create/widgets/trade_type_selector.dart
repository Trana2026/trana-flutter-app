import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/modify_contract_view_model.dart';

class TradeTypeSelector extends HookConsumerWidget {
  final bool isModify;

  const TradeTypeSelector({super.key, this.isModify = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createVM = ref.read(createContractViewModelProvider.notifier);
    final modifyVM = ref.read(modifyContractViewModelProvider.notifier);

    final initialIndex = isModify
        ? (ref.read(modifyContractViewModelProvider).deliveryType ==
                  DeliveryType.direct
              ? 0
              : 1)
        : 1;
    final selectedIndex = useState(initialIndex);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (isModify) {
          modifyVM.updateMethod(selectedIndex.value);
        } else {
          createVM.updateMethod(selectedIndex.value);
        }
      });
      return null;
    }, [selectedIndex.value]);

    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: vrc(context).secondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            selectItem(
              context: context,
              onTap: () => selectedIndex.value = 0,
              label: "직거래",
              isSelected: selectedIndex.value == 0,
            ),
            const SizedBox(width: 10),
            selectItem(
              context: context,
              onTap: () => selectedIndex.value = 1,
              label: "택배 거래",
              isSelected: selectedIndex.value == 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget selectItem({
    required BuildContext context,
    required void Function() onTap,
    required String label,
    required bool isSelected,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: isSelected ? fxc(context).brandColor : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: context.txt(
              color: isSelected
                  ? fxc(context).textBrand
                  : vrc(context).textDisable,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
