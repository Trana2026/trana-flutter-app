import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trana/core/theme/app_theme.dart';

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
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/filter_line.svg',
            height: 20,
            width: 20,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
              isActive ? fxc(context).textBrand! : vrc(context).iconPrimary!,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
