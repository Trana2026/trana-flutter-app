import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/create_contract_page/widgets/contract_photo_chip.dart';

class ContractPhotoSection extends HookConsumerWidget {
  final Color iconColor;

  const ContractPhotoSection({super.key, required this.iconColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 1.5),
          child: Text(
            "거래 사진",
            style: TextStyle(
              color: vrc(context).textTertiary,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            ContractPhotoChip(
              child: Icon(
                Icons.photo_camera_outlined,
                color: iconColor,
                size: 32,
              ),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
