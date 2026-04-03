import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; 
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/create_contract_page/buyer/buyer_create_contract_page.dart';
import 'package:trana/view/authenticated/create_contract_page/seller/seller_create_contract_page.dart';
import 'package:trana/widgets/select_role_card.dart';
import 'package:trana/widgets/primary_button.dart';

class SelectUserRolePage extends HookConsumerWidget {
  const SelectUserRolePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int?>(null);

    const int currentStep = 1;
    const int totalStep = 3;

    final double progress = currentStep / totalStep;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = screenWidth * progress;
    final bool isEnabled = selectedIndex.value != null;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
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
        backgroundColor: vrc(context).background,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                "역할 선택",
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 20,
                  fontFamily: "PretendardBold"
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                "역할을 선택해주세요.\n선택한 역할에 따라 계약 조건이 자동으로 설정됩니다.",
                style: TextStyle(
                  color: vrc(context).textSecondary,
                  fontSize: 15,
                  fontFamily: "PretendardMedium",
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 15),

            SelectRoleCard(
              icon: Icons.person,
              title: "저는 판매자입니다",
              description: "물품을 판매하고 안전하게 대금을 받고싶어요",
              isSelected: selectedIndex.value == 0,
              onTap: () => selectedIndex.value = 0,
            ),
            const SizedBox(height: 10),

            SelectRoleCard(
              icon: Icons.person,
              title: "저는 구매자입니다",
              description: "물품을 수령하고 정품 여부를 보장받고싶어요",
              isSelected: selectedIndex.value == 1,
              onTap: () => selectedIndex.value = 1,
            ),

            const Spacer(),

            PrimaryButton(
              text: "다음",
              onTap: () {
                if (!isEnabled) return;
                if (selectedIndex.value == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SellerCreateContractPage(),
                    ),
                  );
                }
                if (selectedIndex.value == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BuyerCreateContractPage(),
                    ),
                  );
                }
              },
              backgroundColor: isEnabled
                  ? fxc(context).brandColor!
                  : vrc(context).disableColor!,
              foregroundColor: isEnabled
                  ? fxc(context).textBrand!
                  : vrc(context).textDisable!,
            ),
          ],
        ),
      ),
    );
  }
}
