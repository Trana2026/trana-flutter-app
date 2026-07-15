import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/revision_request_view_model.dart';

class RevisionRequestBottomSheet extends HookConsumerWidget {
  const RevisionRequestBottomSheet({super.key});

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
    final revisionState = ref.watch(revisionRequestViewModelProvider);
    final revisionVM = ref.read(revisionRequestViewModelProvider.notifier);

    final selectedFields = revisionState.selectedFields;
    final visibleFields = _allFields
        .where((f) => selectedFields.contains(f))
        .toList();

    final isPending = useRef(false);

    final controllers = useMemoized(
      () => {for (final f in _allFields) f: TextEditingController()},
    );

    final focusNodes = useMemoized(
      () => {for (final f in _allFields) f: FocusNode()},
    );

    final fieldKeys = useMemoized(
      () => {for (final f in _allFields) f: GlobalKey()},
    );

    useEffect(() {
      if (detailState.isCreator) {
        // selectedFields 확장 및 값 주입은 배너에서 바텀시트 띄우기 전에 완료
        // 여기서는 이미 세팅된 state를 읽어 컨트롤러에만 주입
        final s = ref.read(revisionRequestViewModelProvider);
        final reasonByField = {
          '거래 방식': s.deliveryTypeReason,
          '거래 플랫폼': s.tradingPlatformReason,
          '거래 물품명': s.titleReason,
          '거래 금액': s.priceReason,
          '상품 상태': s.conditionSummaryReason,
          '상품 상세 설명': s.conditionDetailsReason,
        };
        for (final e in reasonByField.entries) {
          if (e.value.isNotEmpty) {
            controllers[e.key]?.text = e.value;
          }
        }
      }

      return () {
        for (final node in focusNodes.values) {
          node.dispose();
        }
        for (final c in controllers.values) {
          c.dispose();
        }
      };
    }, const []);

    final mediaQuery = MediaQuery.of(context);
    final keyboardHeight = mediaQuery.viewInsets.bottom;
    final screenHeight = mediaQuery.size.height;
    final safeAreaBottom = keyboardHeight > 0 ? 0.0 : mediaQuery.padding.bottom;
    // container padding(30) + handle(4) + spacing(20) + bottom padding(10)
    const fixedOverhead = 64.0;
    final availableScrollHeight =
        screenHeight - keyboardHeight - safeAreaBottom - fixedOverhead;

    return PendingOverlay(
      isPending: isPending.value,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        decoration: BoxDecoration(
          color: vrc(context).background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: keyboardHeight),
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
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: visibleFields.length > 2
                        ? availableScrollHeight.clamp(110.0, 320.0)
                        : double.infinity,
                  ),
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        for (int i = 0; i < visibleFields.length; i++) ...[
                          ContractFormField(
                            key: fieldKeys[visibleFields[i]],
                            focusNode: focusNodes[visibleFields[i]],
                            label: visibleFields[i],
                            hintText: '수정을 원하시는 이유를 작성해주세요',
                            maxLines: 2,
                            controller: controllers[visibleFields[i]],
                          ),
                        ],
                        PrimaryButton.brand(
                          text: detailState.isCreator ? "확인" : "수정 요청하기",
                          onTap: () async {
                            if (isPending.value) return;
                            isPending.value = true;
                            try {
                              // 1. 요청자일 때
                              if (detailState.isCreator) {
                                createVM.setRevisionRequestedMode(true);

                                createVM.loadFromDraft(
                                  publicCode: detailState.publicCode,
                                  deliveryType: detailState.deliveryType,
                                  role: detailState.myRole,
                                  attachmentIds: detailState.attachmentIds,
                                  existingAttachmentUrls:
                                      detailState.attachmentImageUrls,
                                  tradingPlatform:
                                      detailState.tradingPlatform ?? '',
                                  title: detailState.title ?? '',
                                  price: detailState.price ?? 0,
                                  conditionSummary:
                                      detailState.conditionSummary ?? '',
                                  conditionDetails:
                                      detailState.conditionDetails ?? '',
                                  warrantyPeriodDays:
                                      detailState.warrantyPeriodDays,
                                );

                                context.go(AppRoutes.contractCreate);
                                // 2. 수신자일 때
                              } else {
                                revisionVM.submitReasons({
                                  for (final entry in controllers.entries)
                                    entry.key: entry.value.text,
                                });

                                // 수정 요청
                                final success = await revisionVM
                                    .requestRevision(detailState.publicCode);
                                if (!context.mounted) return;
                                if (!success) {
                                  final state = ref.read(
                                    revisionRequestViewModelProvider,
                                  );
                                  showErrorToast(context, state.error!);
                                  revisionVM.clearError();
                                  return;
                                }

                                Navigator.of(context).pop();
                                context.go(AppRoutes.contractDetail);
                              }
                            } finally {
                              isPending.value = false;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
