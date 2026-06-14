import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_counterparty_banner.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_cta_button.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_detail_header.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_edit_banner.dart';
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
    final bool canEdit =
        status == ContractStatus.ready ||
        status == ContractStatus.revisionRequested;

    if (detailState.isLoading) {
      return Scaffold(
        backgroundColor: vrc(context).background,
        body: const CustomLoadingBar(),
      );
    }

    return Scaffold(
      backgroundColor: vrc(context).secondaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: AppBar(
          backgroundColor: vrc(context).background,
          leading: InkWell(
            onTap: () => context.go(AppRoutes.home),
            child: SizedBox(
              width: 45,
              height: 45,
              child: Icon(
                CooliconsIcon.closeMd,
                color: vrc(context).iconPrimary,
                size: 24,
              ),
            ),
          ),
        ),
      ),
      body: Column(
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: vrc(context).background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: isDraft
                  ? Column(
                      children: [
                        const ContractInprogressText(),
                        const Spacer(),
                      ],
                    )
                  : Column(
                      children: [
                        if (canEdit) const ContractEditBanner(),
                        if (!canEdit) const ContractCounterpartyBanner(),
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
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: vrc(context).background,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: const ContractCtaButtons(),
          ),
        ),
      ),
    );
  }
}
