import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; // 추가
import 'package:trana/core/theme/app_theme.dart';

/// 역할/연령 선택 화면의 선택 가능한 카드 위젯
class SelectRoleCard extends HookConsumerWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showIconBorder;

  const SelectRoleCard({
    super.key,
    required this.icon,
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
        height: 140,
        decoration: BoxDecoration(
          color: isSelected
              ? fxc(context).subtitleGreen
              : vrc(context).secondaryColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? fxc(context).brandColor! : Colors.transparent,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isSelected
                      ? fxc(context).brandColor
                      : vrc(context).background,
                  borderRadius: BorderRadius.circular(13),
                  border: showIconBorder
                      ? Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : vrc(context).borderPrimary!,
                        )
                      : null,
                ),
                child: Icon(
                  icon,
                  color: isSelected
                      ? fxc(context).textBrand
                      : vrc(context).iconSecondary,
                  size: 27,
                ),
              ),
              const SizedBox(height: 13),
              Text(
                title,
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 20,
                  fontFamily: "PretendardBold",
                  letterSpacing: -0.2
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  color: vrc(context).textSecondary,
                  fontSize: 14,
                  fontFamily: "PretendardMedium",
                  letterSpacing: -0.2
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
