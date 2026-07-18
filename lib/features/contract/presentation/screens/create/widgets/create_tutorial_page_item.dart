import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

/// 튜토리얼 팝업 페이지
class CreateTutorialPageItem extends StatelessWidget {
  const CreateTutorialPageItem({
    super.key,
    required this.description,
    required this.illustration,
  });

  final String description;
  final Widget illustration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 안내 문구 (최대 2줄, 페이지 간 높이 고정)
        SizedBox(
          height: 46,
          child: Text(
            description,
            style: TextStyle(
              color: vrc(context).textPrimary,
              fontSize: 15,
              fontFamily: 'PretendardSemiBold',
              height: 1.4,
              letterSpacing: -0.15,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: Center(
            child: AspectRatio(aspectRatio: 1, child: illustration),
          ),
        ),
      ],
    );
  }
}
