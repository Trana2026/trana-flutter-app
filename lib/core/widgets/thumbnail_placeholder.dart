import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';

class ThumbnailPlaceholder extends StatelessWidget {
  const ThumbnailPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: vrc(context).tertiaryColor,
      ),
      child: Icon(
        CooliconsIcon.image02,
        color: vrc(context).textDisable,
        size: 32,
      ),
    );
  }
}
