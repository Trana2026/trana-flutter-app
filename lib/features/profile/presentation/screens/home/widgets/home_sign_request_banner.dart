import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

class HomeSignRequestBanner extends ConsumerWidget {
  const HomeSignRequestBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeContractViewModelProvider);
    final count = homeState.myContracts
        .where((c) => c.status == ContractStatus.shared && !c.isCreator)
        .length;

    return GestureDetector(
      onTap: () => context.push(AppRoutes.contractRequest),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        height: 63,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: fxc(context).opacityBg,
        ),
        child: Row(
          children: [
            Icon(
              CooliconsIcon.editPencilLine02,
              size: 24,
              color: fxc(context).statusModifyRequest,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '서명 요청',
                    style: context.txt(color: fxc(context).textBrand),
                  ),
                  Text(
                    '서명 요청이 들어온 계약서가 $count건 있어요!',
                    style: context.txt(
                      color: fxc(context).textBrand,
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
}
