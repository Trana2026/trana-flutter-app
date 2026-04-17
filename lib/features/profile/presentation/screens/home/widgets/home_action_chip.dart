import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 

class HomeActionChip extends HookConsumerWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color color;
  final Color iconColor;
  final Color textColor;

  const HomeActionChip({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.color,
    required this.iconColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.fromLTRB(12, 0, 14, 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 22, color: iconColor),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontFamily: "PretendardMedium"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
