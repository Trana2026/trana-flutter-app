import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

class ContractTemplateItem extends StatelessWidget {
  final Image image;
  final String categoryName;
  final String productType;
  final String descriptionText;

  const ContractTemplateItem({
    super.key,
    required this.image,
    required this.categoryName,
    required this.productType,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              color: vrc(context).secondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: image,
          ),
          SizedBox(width: 15),
          Column(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryName,
                style: TextStyle(
                  color: vrc(context).textTertiary,
                  fontSize: 14,
                  fontFamily: "PretendardMedium",
                  letterSpacing: -0.2
                ),
              ),
              Text(
                productType,
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 21,
                  fontFamily: "PretendardBold",
                  letterSpacing: -0.2
                ),
              ),
              Text(
                descriptionText,
                style: TextStyle(
                  color: vrc(context).textTertiary,
                  fontSize: 14,
                  fontFamily: "PretendardMedium",
                  height: 1.2,
                  letterSpacing: -0.2
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
