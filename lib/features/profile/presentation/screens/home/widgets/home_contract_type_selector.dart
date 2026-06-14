import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';

class HomeContractTypeSelector extends HookConsumerWidget {
  const HomeContractTypeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: vrc(context).secondaryColor,
      ),
      child: Row(
        children: [
          _SelectItem(label: '전체', index: 0, selectedIndex: selectedIndex),
          _SelectItem(label: '요청받은 계약', index: 1, selectedIndex: selectedIndex),
          _SelectItem(label: '수신한 계약', index: 2, selectedIndex: selectedIndex),
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
  });

  final String label;
  final int index;
  final ValueNotifier<int> selectedIndex;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex.value == index;

    return GestureDetector(
      onTap: () => selectedIndex.value = index,
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
