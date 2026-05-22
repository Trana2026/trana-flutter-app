import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/utils/string_extensions.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_counterparty_banner.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_cta_button.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_detail_header.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_preview_card.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_report_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/viewmodels/contract_detail_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/sign_confirm_bottom_sheet.dart';

class ContractDetailPage extends HookConsumerWidget {
  const ContractDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(contractDetailViewModelProvider);
    final detailVM = ref.read(contractDetailViewModelProvider.notifier);

    ref.listen(contractDetailViewModelProvider, (prev, next) {
      if (next.error != null && next.error != prev?.error) {
        showErrorToast(context, next.error!);
        detailVM.clearError();
      }
    });

    if (detailState.isLoading || detailState.selectedContract == null) {
      return Scaffold(
        backgroundColor: vrc(context).background,
        body: Center(
          child: CircularProgressIndicator(
            color: fxc(context).brandColor,
            strokeWidth: 3,
          ),
        ),
      );
    }

    final contract = detailState.selectedContract!;
    final effectiveStatus = contract.status;
    final effectiveStatusColor = effectiveStatus.appBarColor(context);
    final itemName = contract.productName;
    final price = contract.amount.toString().toPriceFormat;
    final roleLabel = detailState.myParty?.role.label ?? '-';

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: AppBar(
          backgroundColor: effectiveStatusColor,
          leading: InkWell(
            onTap: () => context.go(AppRoutes.home),
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
              statusColor: effectiveStatusColor,
              statusLabel: effectiveStatus.statusLabel(),
              statusIcon: effectiveStatus.statusIcon(),
              itemName: itemName,
              price: price,
              roleLabel: roleLabel,
            ),
            const SizedBox(height: 155),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContractCounterpartyBanner(
                      iconBgColor: effectiveStatus.bannerIconBgColor(context),
                      iconWidget: Icon(
                        effectiveStatus.bannerIcon(),
                        color: fxc(context).textBrand,
                        size: 22,
                      ),
                      topLabel: effectiveStatus.bannerTopLabel(),
                      bottomLabel: effectiveStatus.bannerBottomLabel(),
                      showChevron: effectiveStatus.bannerShowChevron(),
                      onTap: () {},
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
                            letterSpacing: -0.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ContractPreviewCard(),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        "계약서 전문 보기",
                        style: TextStyle(
                          color: vrc(context).textTertiary,
                          fontSize: 13,
                          fontFamily: "PretendardRegular",
                          letterSpacing: -0.2,
                        ),
                      ),
                    ),
                    const Spacer(),
                    _buildCtaButtons(context, ref, effectiveStatus),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCtaButtons(
    BuildContext context,
    WidgetRef ref,
    ContractStatus effectiveStatus,
  ) {
    final detailVM = ref.read(contractDetailViewModelProvider.notifier);

    void showReport() => showModalBottomSheet(
      context: context,
      barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => ContractReportBottomSheet(),
    );

    void showSignFlow() => showModalBottomSheet(
      context: context,
      barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => SignConfirmBottomSheet(parentContext: context),
    );

    return switch (effectiveStatus) {
      ContractStatus.draft => Row(
        children: [
          Expanded(
            flex: 3,
            child: ContractCtaButton(
              text: "삭제하기",
              bg: vrc(context).secondaryColor!,
              fg: vrc(context).textPrimary!,
              onTap: () async {
                // await detailVM.deleteContract();

                if (!context.mounted) return;
                showNormalToast(context, '삭제 완료', null);
                context.go(AppRoutes.home);
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 7,
            child: ContractCtaButton(
              text: "서명 요청하기",
              bg: fxc(context).statusDraft!,
              fg: fxc(context).textBrand!,
              onTap: showSignFlow,
            ),
          ),
        ],
      ),
      ContractStatus.signRequested => Row(
        children: [
          Expanded(
            flex: 3,
            child: ContractCtaButton(
              text: "문제 신고",
              bg: vrc(context).secondaryColor!,
              fg: vrc(context).textPrimary!,
              onTap: showReport,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 7,
            child: ContractCtaButton(
              text: "거래 완료 확정",
              bg: vrc(context).disableColor!,
              fg: vrc(context).textDisable!,
              onTap: () {},
            ),
          ),
        ],
      ),
      ContractStatus.signed => Row(
        children: [
          Expanded(
            flex: 3,
            child: ContractCtaButton(
              text: "문제 신고",
              bg: vrc(context).secondaryColor!,
              fg: vrc(context).textPrimary!,
              onTap: showReport,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 7,
            child: ContractCtaButton(
              text: "거래 완료 확정",
              bg: fxc(context).statusSignRequest!, //수정
              fg: fxc(context).textBrand!,
              onTap: () async => await detailVM.complete(),
            ),
          ),
        ],
      ),
      ContractStatus.completed => Row(
        children: [
          Expanded(
            flex: 3,
            child: ContractCtaButton(
              text: "문제 신고",
              bg: vrc(context).secondaryColor!,
              fg: vrc(context).textPrimary!,
              onTap: showReport,
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
      ContractStatus.reported => ContractCtaButton(
        text: "신고 취소하기",
        bg: vrc(context).secondaryColor!,
        fg: vrc(context).textPrimary!,
        onTap: () {},
      ),
    };
  }
}
