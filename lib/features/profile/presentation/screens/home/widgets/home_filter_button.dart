import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/app_icon.dart';

class HomeFilterButton extends StatelessWidget {
  const HomeFilterButton({
    super.key,
    required this.isActive,
    required this.onToggle,
  });

  final bool isActive;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: isActive
              ? fxc(context).brandColor
              : vrc(context).secondaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: AppIcon.svg(
          asset: 'assets/icons/filter_line.svg',
          size: 20,
          color: isActive ? fxc(context).textBrand! : vrc(context).iconPrimary!,
        ),
      ),
    );
  }
}
