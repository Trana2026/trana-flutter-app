import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

class CustomLoadingBar extends StatelessWidget {
  const CustomLoadingBar({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final indicator = CircularProgressIndicator(
      color: color ?? fxc(context).brandColor,
      strokeWidth: 3,
    );

    return Center(
      child: size == null
          ? indicator
          : SizedBox(width: size, height: size, child: indicator),
    );
  }
}
