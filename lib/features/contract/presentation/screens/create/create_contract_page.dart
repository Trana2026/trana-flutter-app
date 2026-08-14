import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/utils/validation.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_bottom_sheet.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/contract/domain/utils/string_extensions.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/contract_photo_section.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/delivery_type_selector.dart';
import 'package:trana/features/contract/presentation/viewmodels/ai_auto_fill_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/contract_warranty_section.dart';
import 'package:trana/features/contract/presentation/widgets/modals/cost_notice_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/widgets/modals/create_tutorial_bottom_sheet.dart';

class CreateContractPage extends HookConsumerWidget {
  const CreateContractPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (mode, role, isEditMode, isContinueMode) = ref.watch(
      createContractViewModelProvider.select(
        (s) => (s.mode, s.role, s.isEditMode, s.isContinueMode),
      ),
    );
    final status = ref.watch(
      detailContractViewModelProvider.select((s) => s.status),
    );
    final CreateContractState(
      :tradingPlatform,
      :title,
      :price,
      :conditionSummary,
      :conditionDetails,
    ) = ref.read(
      createContractViewModelProvider,
    );

    final platformCtr = useTextEditingController(text: tradingPlatform);
    final nameCtr = useTextEditingController(text: title);
    final priceCtr = useTextEditingController(
      text: price != 0 ? price.toString().toPriceFormat : '',
    );
    final conditionCtr = useTextEditingController(text: conditionSummary);
    final detailCtr = useTextEditingController(text: conditionDetails);
    final priceError = useState<String?>(null);
    final isPending = useState(false);

    // 새 계약 작성 진입 시마다 튜토리얼 안내 노출
    useEffect(() {
      // 수정 모드, 이어서 작성 모드일 때 제외
      if (!isEditMode && !isContinueMode) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;
          showCustomBottomSheet(context, const CreateTutorialBottomSheet());
        });
      }
      return null;
    }, const []);

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

    return PendingOverlay(
      isPending: isPending.value,
      child: Scaffold(
        backgroundColor: vrc(context).background,
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar.leading(
          title: isEditMode ? "계약서 수정" : "새 계약 작성",
          onTapLeading: () {
            if (status == ContractStatus.ready) {
              context.pop();
            } else {
              context.go(AppRoutes.home);
            }
          },
          actions: [
            GestureDetector(
              onTap: () => showCustomBottomSheet(
                context,
                const CreateTutorialBottomSheet(),
              ),
              child: AppIcon.data(icon: CooliconsIcon.info),
            ),
          ],
          bottomProgress: progress,
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
                      const DeliveryTypeSelector(),
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
                      Text("계약의 핵심 조건을 입력해주세요.", style: context.txt()),
                      const SizedBox(height: 20),
                      const ContractPhotoSection(),
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
                      if (role == Role.seller) const ContractWarrantySection(),
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: PrimaryButton.brand(
              text: isEditMode ? "수정 완료" : "생성하기",
              disabled: !isEnabled,
              onTap: () async {
                if (isPending.value) return;
                isPending.value = true;
                try {
                  priceError.value = Validation.price(priceCtr.text);
                  if (priceError.value != null) {
                    // EVT-025: form_validation_failed
                    AnalyticsService.track(
                      'form_validation_failed',
                      properties: {
                        'form_name': 'contract_create_form',
                        'invalid_field_codes': const ['price'],
                        'invalid_field_count': 1,
                        'first_invalid_field': 'price',
                      },
                      ga4: false,
                    );
                    return;
                  }

                  final createVM = ref.read(
                    createContractViewModelProvider.notifier,
                  );
                  createVM.updateEntries(
                    platformText: platformCtr.text,
                    nameText: nameCtr.text,
                    priceText: priceCtr.text,
                    conditionText: conditionCtr.text,
                    detailText: detailCtr.text,
                  );

                  // 1. 요청자가 구매자일 때 (계약 생성 비용 고지)
                  if (role == Role.buyer) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showCustomBottomSheet(
                      context,
                      const CostNoticeBottomSheet(),
                    );
                    // 2. 요청자가 판매자일 때
                  } else {
                    if (status == ContractStatus.ready) {
                      // READY > DRAFT 계약서 상태 되돌림 (Ready 상태에서 수정 시)
                      final detailVM = ref.read(
                        detailContractViewModelProvider.notifier,
                      );
                      final success = await detailVM.revert();
                      if (!success) {
                        if (context.mounted) {
                          final state = ref.read(
                            detailContractViewModelProvider,
                          );
                          showErrorToast(context, state.error!);
                          detailVM.clearError();
                        }
                        return;
                      }
                    }

                    // EVT-024: contract_form_submitted
                    final aiUsed = ref.read(
                      aiAutoFillViewModelProvider,
                    ).isCompleted;
                    final createStateForSubmit = ref.read(
                      createContractViewModelProvider,
                    );
                    AnalyticsService.track(
                      'contract_form_submitted',
                      properties: {
                        'transaction_type':
                            createStateForSubmit.deliveryType.name,
                        // 수정 모드는 기존 첨부(existingAttachmentUrls)를 쓰므로
                        // selectedImages만으로는 실제 이미지 개수를 셀 수 없음
                        'image_count':
                            createStateForSubmit
                                .existingAttachmentUrls
                                .isNotEmpty
                            ? createStateForSubmit.existingAttachmentUrls.length
                            : createStateForSubmit.selectedImages.length,
                        'ai_used': aiUsed,
                        'warranty_days': createStateForSubmit.warrantyPeriodDays,
                        'contract_party_role': role?.name,
                      },
                      ga4: false,
                    );

                    // Draft 항목 업데이트
                    final success = await createVM.updateDraftEntries();
                    if (!context.mounted) return;
                    if (!success) {
                      final state = ref.read(createContractViewModelProvider);
                      showErrorToast(context, state.error!);
                      createVM.clearError();
                      return;
                    }

                    context.push(AppRoutes.contractPreview);
                  }
                } finally {
                  if (context.mounted) isPending.value = false;
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
