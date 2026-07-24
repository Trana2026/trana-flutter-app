import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/viewmodels/report_contract_view_model.dart';

class ReportDetailBottomSheet extends HookConsumerWidget {
  const ReportDetailBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportState = ref.watch(reportContractViewModelProvider);

    final initialReason = reportState.recentReport?.reason;
    final initialDetail = reportState.recentReport?.detail;

    final reasonCtr = useTextEditingController(text: initialReason);
    final detailCtr = useTextEditingController(text: initialDetail);

    return Container(
      height: 320,
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 145,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: vrc(context).disableColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 47, 20, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _Step(selected: true, label: "신고 접수됨"),
                          const SizedBox(height: 8),
                          Container(
                            height: 20,
                            margin: const EdgeInsets.only(left: 19),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: fxc(context).opacityBg!,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          _Step(selected: false, label: "택배 발송"),
                          const SizedBox(height: 8),
                          Container(
                            height: 42,
                            margin: const EdgeInsets.only(left: 19),
                            padding: const EdgeInsets.only(left: 34),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: fxc(context).opacityBg!,
                                  width: 2,
                                ),
                              ),
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "보내주신 문제 물품을 수령하기 전이에요.",
                              style: context.txt(
                                color: vrc(context).textPrimary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          _Step(selected: false, label: "제품 검수"),
                        ],
                      ),
                    ),
                    Container(height: 8, color: vrc(context).secondaryColor),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContractFormField(
                            label: "신고 사유",
                            hintText: "신고 사유를 입력해주세요.",
                            controller: reasonCtr,
                            readOnly: true,
                          ),
                          const SizedBox(height: 8),
                          ContractFormField(
                            label: "상세 내용",
                            hintText: "문제를 자세히 설명해 주세요.",
                            controller: detailCtr,
                            maxLines: 4,
                            readOnly: true,
                          ),
                          const SizedBox(height: 20),
                          PrimaryButton.mono(
                            text: "확인",
                            onTap: () => context.pop(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({required this.selected, required this.label});

  final bool selected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: vrc(context).secondaryColor,
          ),
          alignment: Alignment.center,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: selected
                  ? fxc(context).brandColor
                  : vrc(context).tertiaryColor,
            ),
            alignment: Alignment.center,
            child: Center(
              child: Icon(
                CooliconsIcon.check,
                size: 18,
                color: selected
                    ? fxc(context).textBrand
                    : fxc(context).opacityBg,
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Text(
          label,
          style: context.txt(
            color: vrc(context).textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
