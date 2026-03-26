import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';

class HomeBottomNav extends HookConsumerWidget {
  final int currentIndex;
  final Function(int) onIndexChanged;
  final Map<int, VoidCallback> customOnTaps;

  const HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
    this.customOnTaps = const {},
  });

  static const _items = [
    (icon: Icons.home_outlined, activeIcon: Icons.home, label: '홈'),
    (icon: Icons.add_box_outlined, activeIcon: Icons.add_box, label: '계약 작성'),
    (icon: Icons.person_outline, activeIcon: Icons.person, label: '마이페이지'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: vrc(context).background,
            border: Border.all(color: vrc(context).borderPrimary!, width: 1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              final isActive = currentIndex == index;
              return GestureDetector(
                onTap: customOnTaps[index] ?? () => onIndexChanged(index),
                behavior: HitTestBehavior.opaque,
                child: SizedBox(
                  width: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isActive ? item.activeIcon : item.icon,
                        color: isActive
                            ? vrc(context).iconPrimary
                            : vrc(context).textDisable,
                        size: 26,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: TextStyle(
                          color: isActive
                              ? vrc(context).textPrimary
                              : vrc(context).textDisable,
                          fontSize: 11,
                          fontWeight: isActive
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
