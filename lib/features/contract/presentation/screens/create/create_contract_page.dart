import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/utils/string_extensions.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/trade_type_selector.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/contract_photo_section.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/contract_warranty_section.dart';
import 'package:trana/features/contract/presentation/screens/preview/contract_preview_page.dart';
import 'package:trana/features/contract/presentation/viewmodels/ai_auto_fill_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';

class CreateContractPage extends HookConsumerWidget {
  const CreateContractPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aiVM = ref.read(aiAutoFillViewModelProvider.notifier);
    final createVM = ref.read(createContractViewModelProvider.notifier);

    final nameCtr = useTextEditingController();
    final priceCtr = useTextEditingController();
    final conditionCtr = useTextEditingController();
    final detailCtr = useTextEditingController();
    final priceError = useState<String?>(null);

    useListenable(nameCtr);
    useListenable(priceCtr);
    useListenable(conditionCtr);
    useListenable(detailCtr);

    ref.listen(createContractViewModelProvider, (prev, next) {
      if (next.error != null && next.error != prev?.error) {
        showErrorToast(context, next.error!);
        createVM.clearError();
      }
    });

    ref.listen(aiAutoFillViewModelProvider, (prev, next) {
      if (next.error != null && next.error != prev?.error) {
        showErrorToast(context, next.error!);
        aiVM.clearError();
      }
      if (next.name.isNotEmpty && next.name != prev?.name) {
        nameCtr.text = next.name;
      }
      if (next.amount != 0 && next.amount != prev?.amount) {
        priceCtr.text = next.amount.toString().toPriceFormat;
      }
      if (next.condition.isNotEmpty && next.condition != prev?.condition) {
        conditionCtr.text = next.condition;
      }
      if (next.details.isNotEmpty && next.details != prev?.details) {
        detailCtr.text = next.details;
      }
    });

    final isEnabled =
        nameCtr.text.trim().isNotEmpty &&
        priceCtr.text.trim().isNotEmpty &&
        conditionCtr.text.trim().isNotEmpty &&
        detailCtr.text.trim().isNotEmpty;

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
                    fontFamily: "PretendardBold",
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

                ContractPhotoSection(),
                const SizedBox(height: 16),

                ContractFormField(
                  label: "거래 물품명",
                  hintText: "아이폰 14 프로",
                  controller: nameCtr,
                ),
                const SizedBox(height: 14),

                ContractFormField(
                  label: "거래 금액 (원)",
                  hintText: "380,000",
                  keyboardType: TextInputType.number,
                  controller: priceCtr,
                  errorText: priceError.value,
                  onChanged: (v) {
                    priceError.value = null;
                    final formatted = v.toPriceFormat;
                    priceCtr.value = TextEditingValue(
                      text: formatted,
                      selection: TextSelection.collapsed(
                        offset: formatted.length,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),

                ContractFormField(
                  label: "상품 상태",
                  hintText: "예: 사용감 적음, 미개봉",
                  controller: conditionCtr,
                ),
                const SizedBox(height: 14),

                ContractFormField(
                  label: "상품 상세 설명",
                  hintText: "예: 찍힘, 스크래치",
                  controller: detailCtr,
                ),
                const SizedBox(height: 16),

                ContractWarrantySection(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: PrimaryButton(
          text: "생성하기",
          onTap: () {
            if (!isEnabled) return;

            priceError.value = validateInt(priceCtr.text);
            if (priceError.value != null) return;

            createVM.updateEntries(
              nameText: nameCtr.text,
              priceText: priceCtr.text,
              conditionText: conditionCtr.text,
              detailText: detailCtr.text,
            );
            createVM.generatePdf();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContractPreviewPage(),
              ),
            );
          },
          backgroundColor: isEnabled
              ? fxc(context).brandColor!
              : vrc(context).disableColor!,
          foregroundColor: isEnabled
              ? fxc(context).textBrand!
              : vrc(context).textDisable!,
        ),
      ),
    );
  }

  // 금액 입력값 검증
  String? validateInt(String? v) {
    if (v == null || int.tryParse(v.replaceAll(',', '')) == null) {
      return '금액은 숫자로 입력해주세요.';
    }
    return null;
  }
}
