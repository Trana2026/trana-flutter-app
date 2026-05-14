import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/entities/contract_status.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_counterparty_banner.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_cta_button.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_detail_header.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_preview_card.dart';
import 'package:trana/features/contract/domain/entities/contract_entity.dart';
import 'package:trana/features/contract/domain/entities/user_role.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_report_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/viewmodels/contract_list_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/sign_confirm_bottom_sheet.dart';

class ContractDetailPage extends HookConsumerWidget {
  final ContractStatus status;
  final String? contractId;

  const ContractDetailPage({super.key, required this.status, this.contractId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contracts = ref.watch(contractListProvider);

    ContractEntity? contract;
    for (final c in contracts) {
      if (c.id == contractId) {
        contract = c;
        break;
      }
    }

    final effectiveStatus = contract?.status ?? status;
    final effectiveStatusColor = effectiveStatus.appBarColor(context);
    final itemName = contract?.itemName ?? '-';
    final price = contract?.price ?? '-';
    final roleLabel = contract?.userRole.label ?? '-';

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: AppBar(
          backgroundColor: effectiveStatusColor,
          leading: InkWell(
            onTap: () => context.canPop() ? context.pop() : context.go(AppRoutes.home),
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
                      // TODO(임시): 수신자 서명 완료 시뮬레이션 - 실제 구현 시 수신자가 서명하면
                      // 서버에서 상태가 signComplete로 업데이트되므로 이 onTap 제거 후
                      // contractListProvider를 실시간(polling/websocket)으로 갱신하는 방식으로 교체
                      onTap: effectiveStatus == ContractStatus.signRequest && contractId != null
                          ? () => ref.read(contractListProvider.notifier).updateStatus(
                                contractId!,
                                ContractStatus.signComplete,
                              )
                          : null,
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
                    ContractPreviewCard(itemName: itemName, price: price),
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

  Widget _buildCtaButtons(BuildContext context, WidgetRef ref, ContractStatus effectiveStatus) {
    void showReport() => showModalBottomSheet(
          context: context,
          barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (_) => ContractReportBottomSheet(
            contractId: contractId,
          ),
        );

    void showSignFlow() => showModalBottomSheet(
          context: context,
          barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (_) => SignConfirmBottomSheet(
            parentContext: context,
            contractId: contractId,
          ),
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
                onTap: () {
                  if (contractId != null) {
                    ref.read(contractListProvider.notifier).remove(contractId!);
                  }
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
      ContractStatus.signRequest => Row(
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
      ContractStatus.signComplete => Row(
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
                onTap: () {
                  if (contractId != null) {
                    ref.read(contractListProvider.notifier).updateStatus(
                      contractId!,
                      ContractStatus.tradeDone,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ContractStatus.tradeDone => Row(
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
