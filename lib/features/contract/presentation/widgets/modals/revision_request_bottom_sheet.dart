import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/create_page_mode.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/revision_request_view_model.dart';

class RevisionRequestBottomSheet extends HookConsumerWidget {
  const RevisionRequestBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (isCreator, status) = ref.watch(
      detailContractViewModelProvider.select((s) => (s.isCreator, s.status)),
    );
    final selectedFields = ref.watch(
      revisionRequestViewModelProvider.select((s) => s.selectedFields),
    );
    final detailState = ref.read(detailContractViewModelProvider);
    final isRequested = status == ContractStatus.revisionRequested;
    final isPending = useRef(false);

    final visibleFields = _allFields
        .where((f) => selectedFields.contains(f))
        .toList();

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
      // modal_viewed: 수정 요청 바텀시트
      AnalyticsService.trackScreenView(
        'revision_request_modal',
        entryPoint: 'contract_detail',
      );
      return null;
    }, const []);

    useEffect(() {
      if (isRequested) {
        final revisionState = ref.read(revisionRequestViewModelProvider);
        for (final (label, reasonOf) in _fields) {
          final reason = reasonOf(revisionState);
          if (reason.isNotEmpty) {
            controllers[label]?.text = reason;
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
                        for (final field in visibleFields)
                          ContractFormField(
                            key: fieldKeys[field],
                            focusNode: focusNodes[field],
                            label: field,
                            hintText: '수정을 원하시는 이유를 작성해주세요',
                            maxLines: 2,
                            controller: controllers[field],
                            readOnly: isRequested,
                          ),
                        PrimaryButton.brand(
                          text: isCreator ? "확인" : "수정 요청하기",
                          disabled: (isRequested && !isCreator),
                          onTap: () async {
                            if (isPending.value) return;
                            isPending.value = true;
                            try {
                              // 1. 수정 요청 전 (요청 내용 입력 후 수정 요청)
                              if (!isRequested) {
                                final revisionVM = ref.read(
                                  revisionRequestViewModelProvider.notifier,
                                );
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
                                // 2. 수정 요청 상태 + 요청자일 때 (요청 내용 확인 후 수정 페이지 이동)
                              } else if (isCreator) {
                                final createVM = ref.read(
                                  createContractViewModelProvider.notifier,
                                );
                                createVM.setCreatePageMode(
                                  CreatePageMode.editMode,
                                );

                                createVM.loadFromDraft(
                                  publicCode: detailState.publicCode,
                                  deliveryType: detailState.deliveryType,
                                  role: detailState.myRole,
                                  attachmentIds: detailState.attachmentIds,
                                  existingAttachmentUrls:
                                      detailState.attachmentImageUrls,
                                  tradingPlatform: detailState.tradingPlatform,
                                  title: detailState.title,
                                  price: detailState.price,
                                  conditionSummary:
                                      detailState.conditionSummary,
                                  conditionDetails:
                                      detailState.conditionDetails,
                                  warrantyPeriodDays:
                                      detailState.warrantyPeriodDays,
                                );

                                // EVT-049: contract_revision_started
                                AnalyticsService.track(
                                  'contract_revision_started',
                                  properties: {
                                    'contract_id': detailState.publicCode,
                                    'edit_source': 'change_request',
                                    'actor_role': detailState.isCreator
                                        ? 'creator'
                                        : 'receiver',
                                  },
                                );

                                context.go(AppRoutes.contractCreate);
                                // 3. 수정 요청 상태 + 수신자일 때 (요청 내용 확인)
                              } else {
                                Navigator.pop(context);
                              }
                            } finally {
                              if (context.mounted) isPending.value = false;
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

  static final List<
    (String label, String Function(RevisionRequestState) reason)
  >
  _fields = [
    ('거래 플랫폼', (s) => s.tradingPlatformReason),
    ('거래 방식', (s) => s.deliveryTypeReason),
    ('거래 물품명', (s) => s.titleReason),
    ('거래 금액', (s) => s.priceReason),
    ('상품 상태', (s) => s.conditionSummaryReason),
    ('상품 상세 설명', (s) => s.conditionDetailsReason),
  ];
  static final _allFields = [for (final (label, _) in _fields) label];
}
