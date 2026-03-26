import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/contract_detail_page/widgets/contract_counterparty_banner.dart';
import 'package:trana/view/authenticated/contract_detail_page/widgets/contract_cta_button.dart';
import 'package:trana/view/authenticated/contract_detail_page/widgets/contract_detail_header.dart';
import 'package:trana/view/authenticated/contract_detail_page/widgets/contract_preview_card.dart';
import 'package:trana/view/authenticated/contract_detail_page/widgets/contract_report_bottom_sheet.dart';

class ContractTradeDonePage extends HookConsumerWidget {
  const ContractTradeDonePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: AppBar(
          backgroundColor: fxc(context).brandColor!,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const SizedBox(
              width: 45,
              height: 45,
              child: Icon(Icons.close),
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            ContractDetailHeader(
              statusColor: fxc(context).brandColor!,
              statusLabel: "거래 완료",
              statusIcon: Icons.check_circle_outline,
            ),
            const SizedBox(height: 155),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContractCounterpartyBanner(
                      iconBgColor: fxc(context).brandColor!,
                      iconWidget: Icon(
                        Icons.check,
                        color: fxc(context).textBrand,
                        size: 22,
                      ),
                      topLabel: "거래 완료!",
                      bottomLabel: "무사히 거래가 완료되었어요!",
                      showChevron: false,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.description_outlined,
                          size: 18,
                          color: vrc(context).iconPrimary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "계약 조건",
                          style: TextStyle(
                            color: vrc(context).textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const ContractPreviewCard(),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        "계약서 전문 보기",
                        style: TextStyle(
                          color: vrc(context).textTertiary,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ContractCtaButton(
                            text: "문제 신고",
                            bg: vrc(context).secondaryColor!,
                            fg: vrc(context).textPrimary!,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                barrierColor: const Color(
                                  0xFF000000,
                                ).withValues(alpha: 0.75),
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                builder: (bottomSheetContext) =>
                                    const ContractReportBottomSheet(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 7,
                          child: ContractCtaButton(
                            text: "거래 계약서 다운로드",
                            bg: fxc(context).brandColor!,
                            fg: fxc(context).textBrand!,
                            onTap: () {},
                          ),
                        ),
                      ],
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
