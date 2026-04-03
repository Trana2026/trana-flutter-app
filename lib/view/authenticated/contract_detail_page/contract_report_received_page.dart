import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/contract_detail_page/widgets/contract_counterparty_banner.dart';
import 'package:trana/view/authenticated/contract_detail_page/widgets/contract_cta_button.dart';
import 'package:trana/view/authenticated/contract_detail_page/widgets/contract_detail_header.dart';
import 'package:trana/view/authenticated/contract_detail_page/widgets/contract_preview_card.dart';

class ContractReportReceivedPage extends HookConsumerWidget {
  const ContractReportReceivedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: AppBar(
          backgroundColor: fxc(context).statusError!,
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
              statusColor: fxc(context).statusError!,
              statusLabel: "신고 접수",
              statusIcon: Icons.warning_amber_rounded,
            ),
            const SizedBox(height: 155),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContractCounterpartyBanner(
                      iconBgColor: fxc(context).statusError!,
                      iconWidget: Icon(
                        Icons.warning_amber_rounded,
                        color: fxc(context).textBrand,
                        size: 22,
                      ),
                      topLabel: "진행 상황",
                      bottomLabel: "신고 접수 중",
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
                            fontFamily: "PretendardBold",
                            letterSpacing: -0.2
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const ContractPreviewCard(),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        "계약서 전문 보기",
                        style: TextStyle(
                          color: vrc(context).textTertiary,
                          fontSize: 13,
                          fontFamily: "PretendardRegular",
                          letterSpacing: -0.2
                        ),
                      ),
                    ),
                    const Spacer(),
                    ContractCtaButton(
                      text: "신고 취소하기",
                      bg: vrc(context).secondaryColor!,
                      fg: vrc(context).textPrimary!,
                      onTap: () {},
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
