import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/blurred_container.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

class HomeContractBanner extends ConsumerWidget {
  const HomeContractBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (requestedContracts, requestedCount) = ref.watch(
      homeContractViewModelProvider.select(
        (s) => (s.requestedContracts, s.requestedContracts.length),
      ),
    );

    // 1. 요청된 계약이 없을 때 (배너 X)
    if (requestedContracts.isEmpty) return const SizedBox.shrink();

    // 2. 요청된 계약이 1개 이상일 때
    final soleRequestStatus = requestedContracts.first.status;
    final soleRequestPublicCode = requestedContracts.first.publicCode;

    return GestureDetector(
      onTap: () async {
        if (requestedCount > 1) {
          context.push(AppRoutes.requestList);
          return;
        }

        // 계약 상세 정보 로드
        final detailVM = ref.read(detailContractViewModelProvider.notifier);
        final success = await detailVM.loadDetail(soleRequestPublicCode);
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(detailContractViewModelProvider);
          showErrorToast(context, state.error!);
          detailVM.clearError();
          return;
        }

        if (soleRequestStatus == ContractStatus.shared) {
          context.push(AppRoutes.requestDetail);
        } else if (soleRequestStatus == ContractStatus.revisionRequested ||
            soleRequestStatus == ContractStatus.cancelRequested) {
          context.push(AppRoutes.contractDetail);
        } else if (soleRequestStatus == ContractStatus.receiverSigned) {
          context.push(AppRoutes.finalPreview);
        }
      },
      child: BlurredContainer(
        child: Row(
          children: [
            Icon(
              soleRequestStatus == ContractStatus.cancelRequested
                  ? CooliconsIcon.triangleWarning
                  : CooliconsIcon.editPencilLine02,
              size: 24,
              color: soleRequestStatus == ContractStatus.cancelRequested
                  ? fxc(context).statusError
                  : fxc(context).statusModifyRequest,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getTitle(requestedCount, soleRequestStatus).title,
                    style: context.txt(color: fxc(context).unchangeableWhite),
                  ),
                  Text(
                    '${getTitle(requestedCount, soleRequestStatus).requestType}이 들어온 계약서가 $requestedCount건 있어요!',
                    style: context.txt(
                      color: fxc(context).unchangeableWhite,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              CooliconsIcon.chevronRight,
              size: 24,
              color: fxc(context).textBrand,
            ),
          ],
        ),
      ),
    );
  }

  ({String title, String requestType}) getTitle(
    int count,
    ContractStatus status,
  ) {
    if (count > 1) {
      return (title: "계약 요청 $count건", requestType: "요청");
    } else if (status == ContractStatus.shared) {
      return (title: "서명 요청", requestType: "서명 요청");
    } else if (status == ContractStatus.revisionRequested) {
      return (title: "수정 요청", requestType: "수정 요청");
    } else if (status == ContractStatus.receiverSigned) {
      return (title: "최종 서명 요청", requestType: "서명 요청");
    } else if (status == ContractStatus.cancelRequested) {
      return (title: "취소 요청", requestType: "취소 요청");
    } else {
      return (title: "", requestType: "");
    }
  }
}
