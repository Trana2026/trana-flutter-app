import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';

class DeliveryTypeSelector extends HookConsumerWidget {
  const DeliveryTypeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deliveryType = ref.read(createContractViewModelProvider).deliveryType;
    final selectedType = useState(deliveryType);

    const gap = 10.0;

    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: vrc(context).secondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = (constraints.maxWidth - gap) / 2;
            final selectedIndex = DeliveryType.values.indexOf(
              selectedType.value,
            );
            return Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  left: selectedIndex * (itemWidth + gap),
                  child: Container(
                    width: itemWidth,
                    height: 44,
                    decoration: BoxDecoration(
                      color: fxc(context).brandColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Row(
                  children: [
                    for (final type in DeliveryType.values) ...[
                      if (type != DeliveryType.values.first)
                        const SizedBox(width: gap),
                      _SelectItem(
                        type: type,
                        value: selectedType.value,
                        onTap: () {
                          selectedType.value = type;

                          final createVM = ref.read(
                            createContractViewModelProvider.notifier,
                          );
                          createVM.updateType(selectedType.value);
                        },
                      ),
                    ],
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SelectItem extends StatelessWidget {
  const _SelectItem({
    required this.type,
    required this.value,
    required this.onTap,
  });

  final DeliveryType type;
  final DeliveryType value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          height: 44,
          child: Center(
            child: Text(
              type.label,
              style: context.txt(
                color: value == type
                    ? fxc(context).textBrand
                    : vrc(context).textDisable,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
