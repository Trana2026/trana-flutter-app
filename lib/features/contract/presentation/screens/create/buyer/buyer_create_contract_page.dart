import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/entities/user_role.dart';
import 'package:trana/features/contract/presentation/screens/preview/contract_preview_page.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/contract_photo_section.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/primary_button.dart';

class BuyerCreateContractPage extends HookConsumerWidget {
  final UserRole userRole;

  const BuyerCreateContractPage({super.key, required this.userRole});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemNameController = useTextEditingController();
    final priceController = useTextEditingController();

    const int currentStep = 2;
    const int totalStep = 3;

    final double progress = currentStep / totalStep;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = screenWidth * progress;

    return Scaffold(
      backgroundColor: vrc(context).background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: vrc(context).background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "계약 작성",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontFamily: "PretendardBold",
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 4,
              width: barWidth,
              color: fxc(context).brandColor,
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "계약 상세 내용",
                  style: TextStyle(
                    color: vrc(context).textPrimary,
                    fontSize: 20,
                    fontFamily: "PretendardBold"
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "계약의 핵심 조건을 입력해주세요",
                  style: TextStyle(
                    color: vrc(context).textSecondary,
                    fontSize: 15,
                    fontFamily: "PretendardMedium",
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 18),

                ContractPhotoSection(iconColor: vrc(context).iconSecondary!),
                const SizedBox(height: 16),

                ContractFormField(
                  label: "거래 물품명",
                  hintText: "아이폰 14 프로",
                  controller: itemNameController,
                ),
                const SizedBox(height: 14),

                ContractFormField(
                  label: "거래 금액 (원)",
                  hintText: "380,000",
                  keyboardType: TextInputType.number,
                  controller: priceController,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
        child: PrimaryButton(
          text: "생성하기",
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContractPreviewPage(
                userRole: userRole,
                itemName: itemNameController.text,
                price: priceController.text,
              ),
            ),
          ),
          backgroundColor: fxc(context).brandColor!,
          foregroundColor: fxc(context).textBrand!,
        ),
      ),
    );
  }
}
