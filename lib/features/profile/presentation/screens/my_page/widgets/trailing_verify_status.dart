import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';

class TrailingVerifyStatus extends StatelessWidget {
  const TrailingVerifyStatus({super.key, required this.verified});

  final bool verified;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: verified ? fxc(context).opacitySuccess : fxc(context).borderOP,
      ),
      child: Text(
        verified ? "완료" : "미완료",
        style: context.txt(
          color: verified
              ? fxc(context).brandColor
              : vrc(context).textSecondary,
          fontSize: 12,
        ),
      ),
    );
  }
}
