import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';

class EmptyContractView extends StatelessWidget {
  const EmptyContractView({super.key, required this.emptyText});

  final String emptyText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CooliconsIcon.fileBlank,
            color: vrc(context).disableColor,
            size: 28,
          ),
          const SizedBox(height: 16),
          Text(emptyText, style: context.txt(color: vrc(context).textPrimary)),
        ],
      ),
    );
  }
}
