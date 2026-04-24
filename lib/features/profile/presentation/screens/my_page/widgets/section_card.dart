import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

class SectionCard extends StatelessWidget {
  final List<Widget> children;

  const SectionCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}