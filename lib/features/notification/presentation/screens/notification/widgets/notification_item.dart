import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/utils/date_time_extensions.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/features/notification/domain/entities/notification_entity.dart';

class NotificationItem extends HookConsumerWidget {
  const NotificationItem({super.key, required this.noti});

  final NotificationEntity noti;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: vrc(context).borderPrimary!)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIcon.svg(
            asset: "assets/icons/trana.svg",
            color: fxc(context).brandColor,
            size: 20,
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
                      noti.title,
                      style: context.txt(
                        color: vrc(context).textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      noti.createdAt.timeAgo,
                      style: context.txt(
                        color: vrc(context).textSecondary,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  noti.body,
                  style: context.txt(
                    color: vrc(context).textSecondary,
                    fontWeight: FontWeight.normal,
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
