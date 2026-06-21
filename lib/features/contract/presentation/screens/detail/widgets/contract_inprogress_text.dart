import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';

class ContractInprogressText extends StatelessWidget {
  const ContractInprogressText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "작성된 계약이 없습니다",
            style: context.txt(
              color: vrc(context).textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text("작성중인 계약서를 마무리해주세요", style: context.txt()),
        ],
      ),
    );
  }
}
