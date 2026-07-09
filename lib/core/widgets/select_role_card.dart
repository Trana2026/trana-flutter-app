import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; // 추가
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/app_icon.dart';

/// 역할/연령 선택 화면의 선택 가능한 카드 위젯
class SelectRoleCard extends HookConsumerWidget {
  final AppIcon appIcon;
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showIconBorder;

  const SelectRoleCard({
    super.key,
    required this.appIcon,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
    this.showIconBorder = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected
              ? fxc(context).subtitleGreen
              : vrc(context).secondaryColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? fxc(context).brandColor! : Colors.transparent,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: isSelected
                      ? fxc(context).brandColor
                      : vrc(context).tertiaryColor,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: appIcon.copyWith(
                  size: 23,
                  color: isSelected
                      ? fxc(context).textBrand
                      : vrc(context).iconDisable,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: context.txt(
                  color: vrc(context).textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(description, style: context.txt()),
            ],
          ),
        ),
      ),
    );
  }
}
