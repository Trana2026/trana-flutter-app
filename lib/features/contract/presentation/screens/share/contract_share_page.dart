import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/share_contract_view_model.dart';

class ContractSharePage extends HookConsumerWidget {
  const ContractSharePage({super.key, required this.publicCode});

  final String publicCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeCtr = useTextEditingController();
    final isPending = useState(false);

    useEffect(() {
      // EVT-032: contract_share_started
      AnalyticsService.track(
        'contract_share_started',
        properties: {
          'contract_id': publicCode,
          'share_method': 'kakao',
          'contract_party_role': ref
              .read(createContractViewModelProvider)
              .role
              ?.name,
        },
      );
      return null;
    }, const []);

    useListenable(codeCtr);

    final isEnabled = codeCtr.text.trim().isNotEmpty;

    return PendingOverlay(
      isPending: isPending.value,
      child: Scaffold(
        backgroundColor: vrc(context).background,
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar.leading(
          title: "계약서 공유하기",
          onTapLeading: () => context.go(AppRoutes.home),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "계약서 초안 생성 완료",
                    style: context.txt(
                      color: vrc(context).textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text("초안에서 계약의 핵심 조건을 확인해주세요.", style: context.txt()),
                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () => context.push(AppRoutes.entirePreview),
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: vrc(context).secondaryColor,
                      ),
                      child: Row(
                        children: [
                          AppIcon.svg(
                            asset: "assets/icons/file.svg",
                            color: vrc(context).iconSecondary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "계약서 초안",
                              style: context.txt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          AppIcon.data(
                            icon: CooliconsIcon.chevronRight,
                            color: vrc(context).iconSecondary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text("전송 채널", style: context.txt()),
                  const SizedBox(height: 4),
                  Container(
                    width: double.infinity,
                    height: 53,
                    decoration: BoxDecoration(
                      color: fxc(context).subtitleKakao,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: fxc(context).borderKakao!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcon.svg(
                          asset: 'assets/icons/kakaotalk.svg',
                          size: 22,
                          color: vrc(context).textPrimary!,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "카카오톡",
                          style: context.txt(color: vrc(context).textPrimary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ContractFormField(
                    label: "상대방 고유코드",
                    hintText: "거래 상대방의 고유코드를 입력해주세요",
                    keyboardType: TextInputType.visiblePassword,
                    controller: codeCtr,
                    inputFormatters: [
                      TextInputFormatter.withFunction(
                        (oldValue, newValue) => newValue.copyWith(
                          text: newValue.text.toUpperCase(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: PrimaryButton.mono(
                    text: "취소",
                    onTap: () => context.go(AppRoutes.home),
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  flex: 7,
                  child: PrimaryButton.brand(
                    text: "카카오톡으로 요청하기",
                    disabled: !isEnabled,
                    onTap: () async {
                      if (isPending.value) return;
                      isPending.value = true;
                      try {
                        final shareVM = ref.read(
                          shareContractViewModelProvider.notifier,
                        );
                        shareVM.updateInput(code: codeCtr.text.trim());

                        // 서명 요청
                        final success = await shareVM.share(publicCode);
                        if (!context.mounted) return;
                        if (!success) {
                          final state = ref.read(
                            shareContractViewModelProvider,
                          );
                          showErrorToast(context, state.error!);
                          shareVM.clearError();
                          return;
                        }

                        context.go(AppRoutes.contractDetail);
                      } finally {
                        if (context.mounted) isPending.value = false;
                      }
                    },
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
