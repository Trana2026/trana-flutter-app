import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';

/// 인트로 화면의 서비스 혜택 항목 카드
class IntroBenefitBox extends HookConsumerWidget {
  final IconData icon;
  final String title;
  final String description;

  const IntroBenefitBox({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: vrc(context).background,
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: vrc(context).borderPrimary!),
              ),
              child: Icon(icon, color: vrc(context).iconPrimary, size: 20),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: vrc(context).textPrimary,
                      fontSize: 17,
                      fontFamily: "PretendardBold"
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: vrc(context).textSecondary,
                      fontSize: 14,
                      fontFamily: "PretendardRegular"
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}