import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; // 추가
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';

class SelectRoleCard extends HookConsumerWidget {
  final IconData? icon;
  final String? iconAsset;
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showIconBorder;

  const SelectRoleCard({
    super.key,
    this.icon,
    this.iconAsset,
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
                child: Center(
                  child: iconAsset != null
                      ? SvgPicture.asset(
                          iconAsset!,
                          height: 23,
                          width: 23,
                          fit: BoxFit.contain,
                          colorFilter: ColorFilter.mode(
                            isSelected
                                ? fxc(context).textBrand!
                                : vrc(context).iconDisable!,
                            BlendMode.srcIn,
                          ),
                        )
                      : Icon(
                          icon,
                          color: isSelected
                              ? fxc(context).textBrand
                              : vrc(context).iconDisable,
                          size: 23,
                        ),
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
