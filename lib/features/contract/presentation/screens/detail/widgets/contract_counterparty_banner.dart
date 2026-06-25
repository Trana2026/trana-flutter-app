import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/modification_request_bottom_sheet.dart';

class ContractCounterpartyBanner extends HookConsumerWidget {
  const ContractCounterpartyBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final detailVM = ref.read(detailContractViewModelProvider.notifier);

    final status = detailState.status;

    return GestureDetector(
      onTap: () async {
        // 계약서 초안 (계약서 수정하기)
        if (status == ContractStatus.ready) {
          final router = GoRouter.of(context);
          final success = await detailVM.revert();
          if (!success) {
            if (context.mounted) {
              final state = ref.read(detailContractViewModelProvider);
              showErrorToast(context, state.error!);
              detailVM.clearError();
            }
            return;
          }

          router.push(AppRoutes.contractCreate);
          // 수정 요청  (계약서 수정하기)
        } else if (status == ContractStatus.revisionRequested &&
            detailState.isCreator) {
          showModalBottomSheet<void>(
            context: context,
            barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (_) => ModificationRequestBottomSheet(),
          );
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: vrc(context).secondaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: status.bannerIconBgColor(context),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Icon(
                status.bannerIcon(detailState.isCreator),
                color: status.bannerIconColor(context),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (status
                      .bannerTopLabel(detailState.isCreator)
                      .isNotEmpty) ...[
                    Text(
                      status.bannerTopLabel(detailState.isCreator),
                      style: context.txt(
                        color: vrc(context).textTertiary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                  Text(
                    status.bannerBottomLabel(detailState.isCreator),
                    style: context.txt(
                      color: vrc(context).textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (status.bannerShowChevron())
              Icon(
                CooliconsIcon.chevronRight,
                color: vrc(context).iconSecondary,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
