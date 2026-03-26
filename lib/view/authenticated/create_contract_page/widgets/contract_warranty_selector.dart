import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';

class ContractWarrantySelector extends HookConsumerWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final List<String> options;

  const ContractWarrantySelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
    this.options = const ["없음", "3일", "7일"],
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref 매개변수 추가
    return Row(
      children: List.generate(options.length, (index) {
        final isSelected = selectedIndex == index;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index == options.length - 1 ? 0 : 10,
            ),
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 52,
                decoration: BoxDecoration(
                  color: isSelected
                      ? fxc(context).brandColor
                      : vrc(context).secondaryColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                alignment: Alignment.center,
                child: Text(
                  options[index],
                  style: TextStyle(
                    color: isSelected
                        ? fxc(context).textBrand
                        : vrc(context).textDisable,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
