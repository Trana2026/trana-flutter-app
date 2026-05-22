import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/entities/contract_requests_entity.dart';
import 'package:trana/features/contract/presentation/viewmodels/contract_request_view_model.dart';

class HomeContractRequestBanner extends ConsumerWidget {
  const HomeContractRequestBanner({super.key, required this.request});

  final ContractRequestsEntity request;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestState = ref.watch(contractRequestViewModelProvider);
    final requestVM = ref.read(contractRequestViewModelProvider.notifier);

    final length = requestState.requests.length;

    return GestureDetector(
      onTap: () async {
        // 페이지 진입 전 계약 정보 미리 로드
        await requestVM.readReceivedContract();

        if (!context.mounted) return;
        context.push(AppRoutes.contractRequest);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 14, 20, 14),
        height: 68,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: vrc(context).background,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: vrc(context).tertiaryColor,
              ),
              child: Icon(
                Icons.description_outlined,
                size: 24,
                color: fxc(context).brandColor,
              ),
            ),
            const SizedBox(width: 10),

            Expanded(
              child: Text(
                '작성해야 하는 계약서가 $length건 있어요!',
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontFamily: 'PretendardMedium',
                  height: 1.5,
                  letterSpacing: 0.16,
                ),
              ),
            ),
            const SizedBox(width: 10),

            Icon(
              Icons.arrow_forward,
              size: 24,
              color: vrc(context).iconDisable,
            ),
          ],
        ),
      ),
    );
  }
}
