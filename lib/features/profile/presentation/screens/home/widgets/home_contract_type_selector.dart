import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';

class HomeContractTypeSelector extends StatelessWidget {
  const HomeContractTypeSelector({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: vrc(context).secondaryColor,
      ),
      child: Row(
        children: [
          _SelectItem(
            label: '전체',
            index: 0,
            selectedIndex: selectedIndex,
            onSelect: onSelect,
          ),
          _SelectItem(
            label: '요청한 계약',
            index: 1,
            selectedIndex: selectedIndex,
            onSelect: onSelect,
          ),
          _SelectItem(
            label: '수신한 계약',
            index: 2,
            selectedIndex: selectedIndex,
            onSelect: onSelect,
          ),
        ],
      ),
    );
  }
}

class _SelectItem extends StatelessWidget {
  const _SelectItem({
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onSelect,
  });

  final String label;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? vrc(context).background : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.txt(
            color: isSelected
                ? vrc(context).textPrimary
                : vrc(context).textDisable,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
