import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_counterparty_banner.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_cta_button.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_detail_header.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_inprogress_text.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_preview_card.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_summary_card.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';

class ContractDetailPage extends HookConsumerWidget {
  const ContractDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);

    final status = detailState.status;
    final bool isDraft =
        status == ContractStatus.inProgress || status == ContractStatus.draft;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: vrc(context).background,
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.go(AppRoutes.home),
          child: Icon(
            CooliconsIcon.closeMd,
            color: vrc(context).textPrimary,
            size: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: vrc(context).secondaryColor,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                decoration: BoxDecoration(
                  color: vrc(context).background,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const ContractDetailHeader(),
                    if (!isDraft) ...[
                      const SizedBox(height: 16),
                      const ContractSummaryCard(),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: vrc(context).background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: isDraft
                    ? Column(children: [const ContractInprogressText()])
                    : Column(
                        children: [
                          const ContractCounterpartyBanner(),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const SizedBox(width: 4),
                              Icon(
                                CooliconsIcon.fileBlank,
                                size: 20,
                                color: vrc(context).iconPrimary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "계약 조건",
                                style: context.txt(
                                  color: vrc(context).textPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "계약서 전문 보기",
                                style: context.txt(
                                  color: vrc(context).textTertiary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const ContractPreviewCard(),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: vrc(context).background,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const ContractCtaButtons(),
          ),
        ),
      ),
    );
  }
}
