import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 7),
      child: Text(
        title,
        style: TextStyle(
          color: vrc(context).textPrimary,
          fontSize: 16,
          fontFamily: "PretendardSemiBold",
          letterSpacing: -0.2
        ),
      ),
    );
  }
}
