import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/presentation/screens/template/contract_template_page.dart';
import 'package:trana/features/contract/domain/entities/contract_status.dart';
import 'package:trana/features/contract/presentation/extensions/contract_status_ui.dart';
import 'package:trana/features/contract/domain/entities/user_role.dart';
import 'package:trana/features/contract/presentation/viewmodels/contract_list_view_model.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_action_chip.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_contract_card.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_empty_state.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_search_bar.dart';
import 'package:trana/features/notification/presentation/screens/notification/notification_page.dart';

class HomeMainView extends HookConsumerWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contracts = ref.watch(contractListProvider);

    return SafeArea(
      bottom: false,
      child: InkWell(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1),
                            child: Text(
                              "내 계약서",
                              style: TextStyle(
                                color: vrc(context).textPrimary,
                                fontSize: 20,
                                fontFamily: "PretendardBold"
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "거래 내역 관리",
                            style: TextStyle(
                              color: vrc(context).textSecondary,
                              fontSize: 15,
                              fontFamily: "PretendardMedium"
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationPage(),
                          ),
                        ),
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: vrc(context).secondaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Icon(
                            Icons.notifications_none_rounded,
                            size: 26,
                            color: vrc(context).iconPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 17),
                  const HomeSearchBar(),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      HomeActionChip(
                        icon: Icons.add,
                        title: "템플릿 폴더 생성",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContractTemplatePage(),
                            ),
                          );
                        },
                        color: fxc(context).brandColor!,
                        iconColor: fxc(context).textBrand!,
                        textColor: fxc(context).textBrand!,
                      ),
                      const SizedBox(width: 7),
                      HomeActionChip(
                        icon: Icons.folder_outlined,
                        title: "템플릿",
                        onTap: () {},
                        color: vrc(context).tertiaryColor!,
                        iconColor: vrc(context).textPrimary!,
                        textColor: vrc(context).iconPrimary!,
                      ),
                      const SizedBox(width: 7),
                      HomeActionChip(
                        icon: Icons.tune,
                        title: "필터",
                        onTap: () {},
                        color: vrc(context).tertiaryColor!,
                        iconColor: vrc(context).textPrimary!,
                        textColor: vrc(context).iconPrimary!,
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                color: vrc(context).secondaryColor,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 100),
                  children: [
                    Text(
                      "최근 활동",
                      style: TextStyle(
                        color: vrc(context).textSecondary,
                        fontSize: 14,
                        fontFamily: "PretendardMedium"
                      ),
                    ),
                    const SizedBox(height: 22),

                    if (contracts.isEmpty)
                      const HomeEmptyState()
                    else
                      ...contracts.asMap().entries.map((entry) {
                        final i = entry.key;
                        final c = entry.value;
                        final d = c.createdAt;
                        final dateStr =
                            '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
                        return Column(
                          children: [
                            HomeContractCard(
                              roleLabel: c.userRole.label,
                              statusLabel: c.status.statusLabel(),
                              statusColor: c.status.appBarColor(context),
                              statusTextColor: fxc(context).textBrand!,
                              itemName: c.itemName,
                              price: '${c.price}원',
                              date: dateStr,
                              onTap: () => context.push(
                                switch (c.status) {
                                  ContractStatus.draft => AppRoutes.contractDraft,
                                  ContractStatus.signRequest => AppRoutes.contractSignRequest,
                                  ContractStatus.signComplete => AppRoutes.contractSignComplete,
                                  ContractStatus.tradeDone => AppRoutes.contractTradeDone,
                                  ContractStatus.reported => AppRoutes.contractReportReceived,
                                },
                                extra: c.id,
                              ),
                            ),
                            if (i < contracts.length - 1) const SizedBox(height: 10),
                          ],
                        );
                      }),
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
