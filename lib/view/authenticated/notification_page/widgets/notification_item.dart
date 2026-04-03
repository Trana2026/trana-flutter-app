import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';

class NotificationItem extends HookConsumerWidget { 
  final String title;
  final String body;
  final String time;
  final IconData icon;
  final Color iconColor;

  const NotificationItem({
    super.key,
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: vrc(context).textPrimary,
                        fontSize: 14,
                        fontFamily: "PretendardBold"
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: vrc(context).textSecondary,
                        fontSize: 12,
                        fontFamily: "PretendardRegular"
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: TextStyle(
                    color: vrc(context).textSecondary,
                    fontSize: 13,
                    fontFamily: "PretendardRegular",
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}