import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

class MyPageMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final String? statusText;
  final bool isSwitch;
  final bool showChevron;

  const MyPageMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.statusText,
    this.isSwitch = false,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Icon(
                icon,
                color: vrc(context).iconPrimary,
                size: 22,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: vrc(context).textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (trailing != null)
                Text(
                  trailing!,
                  style: TextStyle(color: vrc(context).textPrimary, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              if (statusText != null)
                Text(
                  statusText!,
                  style: TextStyle(
                    color: statusText == "완료" ? fxc(context).brandColor : vrc(context).textSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (isSwitch)
                Switch(
                  value: true,
                  onChanged: (v) {},
                  activeColor: fxc(context).brandColor,
                ),
              if (showChevron && !isSwitch)
                Icon(Icons.chevron_right, color: vrc(context).textSecondary, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}