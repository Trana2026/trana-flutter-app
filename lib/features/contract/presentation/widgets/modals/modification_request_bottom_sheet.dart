import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/modification_request_view_model.dart';

class ModificationRequestBottomSheet extends HookConsumerWidget {
  const ModificationRequestBottomSheet({super.key});

  static const _allFields = [
    '거래 플랫폼',
    '거래 방식',
    '거래 물품명',
    '거래 금액',
    '상품 상태',
    '상품 상세 설명',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createVM = ref.read(createContractViewModelProvider.notifier);
    final detailState = ref.watch(detailContractViewModelProvider);
    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    final modifyState = ref.watch(modificationRequestViewModelProvider);
    final modifyVM = ref.read(modificationRequestViewModelProvider.notifier);

    final selectedFields = modifyState.selectedFields;
    final visibleFields = _allFields
        .where((f) => selectedFields.contains(f))
        .toList();

    final controllers = useMemoized(
      () => {for (final f in visibleFields) f: TextEditingController()},
    );

    useEffect(() {
      return () {
        for (final c in controllers.values) {
          c.dispose();
        }
      };
    }, const []);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 145,
                height: 4,
                decoration: BoxDecoration(
                  color: vrc(context).disableColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: visibleFields.length > 2 ? 310 : null,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < visibleFields.length; i++) ...[
                      ContractFormField(
                        label: visibleFields[i],
                        hintText: '수정을 원하시는 이유를 작성해주세요',
                        maxLines: 2,
                        controller: controllers[visibleFields[i]],
                      ),
                      if (i < visibleFields.length - 1)
                        const SizedBox(height: 16),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              text: detailState.isCreator ? "확인" : "수정 요청하기",
              onTap: () async {
                final success = await detailVM.revert();
                if (!context.mounted) return;
                if (!success) {
                  final state = ref.read(detailContractViewModelProvider);
                  showErrorToast(context, state.error!);
                  detailVM.clearError();
                  return;
                }

                if (detailState.isCreator) {
                  createVM.loadFromDraft(
                    publicCode: detailState.publicCode,
                    consentType: detailState.consentType,
                    deliveryType: detailState.deliveryType,
                    role: detailState.myRole,
                    attachmentIds: detailState.attachmentIds,
                    existingAttachmentUrls: detailState.attachmentImageUrls,
                    tradingPlatform: detailState.tradingPlatform ?? '',
                    title: detailState.title ?? '',
                    price: detailState.price ?? 0,
                    conditionSummary: detailState.conditionSummary ?? '',
                    conditionDetails: detailState.conditionDetails ?? '',
                    warrantyPeriodDays: detailState.warrantyPeriodDays,
                  );

                  context.go(AppRoutes.contractCreate);
                } else {
                  modifyVM.submitReasons({
                    for (final entry in controllers.entries)
                      entry.key: entry.value.text,
                  });

                  final success = await modifyVM.requestRevision(
                    detailState.publicCode,
                  );
                  if (!context.mounted) return;
                  if (!success) {
                    final state = ref.read(
                      modificationRequestViewModelProvider,
                    );
                    showErrorToast(context, state.error!);
                    modifyVM.clearError();
                    return;
                  }

                  Navigator.of(context).pop();
                  context.go(AppRoutes.contractDetail);
                }
              },
              backgroundColor: fxc(context).brandColor!,
              foregroundColor: fxc(context).textBrand!,
            ),
          ],
        ),
      ),
    );
  }
}
