import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

class CustomLoadingBar extends StatelessWidget {
  const CustomLoadingBar({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? fxc(context).brandColor,
        strokeWidth: 3,
      ),
    );
  }
}
