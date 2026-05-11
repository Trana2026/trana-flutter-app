import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/entities/user_role.dart';
import 'package:trana/features/contract/presentation/screens/preview/contract_preview_page.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/contract_photo_section.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/contract_warranty_selector.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/core/widgets/trade_type_selector.dart';

class SellerCreateContractPage extends HookConsumerWidget {
  final UserRole userRole;

  const SellerCreateContractPage({super.key, required this.userRole});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWarranty = useState<int>(0);
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
            fontFamily: "PretendardBold"
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
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TradeTypeSelector(),
                const SizedBox(height: 20),
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
                const SizedBox(height: 16),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 1.5),
                      child: Text(
                        "보증 기간",
                        style: TextStyle(
                          color: vrc(context).textTertiary,
                          fontSize: 15,
                          fontFamily: "PretendardMedium"
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.info_outline_rounded,
                      size: 16,
                      color: vrc(context).iconSecondary,
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                ContractWarrantySelector(
                  selectedIndex: selectedWarranty.value,
                  onChanged: (index) => selectedWarranty.value = index,
                ),
                const SizedBox(height: 14),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: fxc(context).subtitleBlue,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: fxc(context).iconInfo,
                        size: 22,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "보증 기간을 제공하면 구매자의 신뢰도가 40% 증가합니다. 명확한 조건은 분쟁을 예방합니다.",
                          style: TextStyle(
                            color: fxc(context).textInfo,
                            fontSize: 13,
                            fontFamily: "PretendardMedium",
                            height: 1.35,
                            letterSpacing: -0.2
                          ),
                        ),
                      ),
                    ],
                  ),
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
