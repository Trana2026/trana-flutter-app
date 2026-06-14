import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/contract/domain/utils/string_extensions.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/contract_photo_section.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/trade_type_selector.dart';
import 'package:trana/features/contract/presentation/viewmodels/ai_auto_fill_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/modify_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/contract_warranty_section.dart';

class CreateContractPage extends HookConsumerWidget {
  final bool isModify;

  const CreateContractPage({super.key, this.isModify = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createState = ref.watch(createContractViewModelProvider);
    final createVM = ref.read(createContractViewModelProvider.notifier);
    final modifyState = ref.watch(modifyContractViewModelProvider);
    final modifyVM = ref.read(modifyContractViewModelProvider.notifier);

    final platform = isModify
        ? modifyState.tradingPlatform
        : createState.tradingPlatform;
    final title = isModify ? modifyState.title : createState.title;
    final price = isModify ? modifyState.price : createState.price;
    final summary = isModify
        ? modifyState.conditionSummary
        : createState.conditionSummary;
    final detail = isModify
        ? modifyState.conditionDetails
        : createState.conditionDetails;
    final role = isModify ? modifyState.role : createState.role;

    final platformCtr = useTextEditingController(text: platform);
    final nameCtr = useTextEditingController(text: title);
    final priceCtr = useTextEditingController(
      text: price != 0 ? price.toString().toPriceFormat : '',
    );
    final conditionCtr = useTextEditingController(text: summary);
    final detailCtr = useTextEditingController(text: detail);
    final priceError = useState<String?>(null);

    useListenable(platformCtr);
    useListenable(nameCtr);
    useListenable(priceCtr);
    useListenable(conditionCtr);
    useListenable(detailCtr);

    ref.listen(aiAutoFillViewModelProvider, (prev, next) {
      if (next.platform.isNotEmpty && next.platform != prev?.platform) {
        platformCtr.text = next.platform;
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
        platformCtr.text.trim().isNotEmpty &&
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
        leading: InkWell(
          onTap: () => context.go(AppRoutes.home),
          child: Icon(
            CooliconsIcon.chevronLeft,
            color: vrc(context).iconPrimary,
            size: 24,
          ),
        ),
        title: Text(
          "새 계약 작성",
          style: context.txt(
            color: vrc(context).textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TradeTypeSelector(isModify: isModify),
                    const SizedBox(height: 20),
                    Text(
                      "계약 상세 내용",
                      style: context.txt(
                        color: vrc(context).textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text("계약의 핵심 조건을 입력해주세요", style: context.txt()),
                    const SizedBox(height: 20),
                    ContractPhotoSection(isModify: isModify),
                  ],
                ),
              ),
              Container(height: 8, color: vrc(context).secondaryColor),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "계약 상세 내용",
                      style: context.txt(color: vrc(context).textPrimary),
                    ),
                    const SizedBox(height: 20),
                    ContractFormField(
                      label: "거래 플랫폼",
                      hintText: "거래 플랫폼을 입력해주세요(ex. 당근마켓, 중고나라...)",
                      controller: platformCtr,
                    ),
                    const SizedBox(height: 8),
                    ContractFormField(
                      label: "거래 물품명",
                      hintText: "예: 아이폰 14 프로",
                      controller: nameCtr,
                    ),
                    const SizedBox(height: 8),
                    ContractFormField(
                      label: "거래 금액 (원)",
                      hintText: "예: 200,000",
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
                    const SizedBox(height: 8),
                    ContractFormField(
                      label: "상품 상태",
                      hintText: "예: 사용감 적음, 미개봉",
                      controller: conditionCtr,
                    ),
                    const SizedBox(height: 8),
                    ContractFormField(
                      label: "상품 상세 설명",
                      hintText: "예: 찍힘, 스크래치",
                      controller: detailCtr,
                    ),
                    const SizedBox(height: 8),
                    if (role == Role.seller)
                      ContractWarrantySection(isModify: isModify),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: PrimaryButton(
            text: "생성하기",
            onTap: () async {
              if (!isEnabled) return;

              priceError.value = validateInt(priceCtr.text);
              if (priceError.value != null) return;

              final bool success;
              if (isModify) {
                modifyVM.updateEntries(
                  platformText: platformCtr.text,
                  nameText: nameCtr.text,
                  priceText: priceCtr.text,
                  conditionText: conditionCtr.text,
                  detailText: detailCtr.text,
                );
                success = await modifyVM.updateDraftEntries();
                if (!context.mounted) return;
                if (!success) {
                  showErrorToast(
                    context,
                    ref.read(modifyContractViewModelProvider).error!,
                  );
                  modifyVM.clearError();
                  return;
                }
              } else {
                createVM.updateEntries(
                  platformText: platformCtr.text,
                  nameText: nameCtr.text,
                  priceText: priceCtr.text,
                  conditionText: conditionCtr.text,
                  detailText: detailCtr.text,
                );
                success = await createVM.updateDraftEntries();
                if (!context.mounted) return;
                if (!success) {
                  showErrorToast(
                    context,
                    ref.read(createContractViewModelProvider).error!,
                  );
                  createVM.clearError();
                  return;
                }
              }

              context.push(AppRoutes.contractPreview);
            },
            backgroundColor: isEnabled
                ? fxc(context).brandColor!
                : vrc(context).disableColor!,
            foregroundColor: isEnabled
                ? fxc(context).textBrand!
                : vrc(context).textDisable!,
          ),
        ),
      ),
    );
  }

  String? validateInt(String? v) {
    if (v == null || int.tryParse(v.replaceAll(',', '')) == null) {
      return '금액은 숫자로 입력해주세요.';
    }
    return null;
  }
}
