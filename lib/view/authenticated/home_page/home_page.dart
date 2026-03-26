import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/home_page/widgets/home_action_chip.dart';
import 'package:trana/view/authenticated/home_page/widgets/home_bottom_nav.dart';
import 'package:trana/view/authenticated/home_page/widgets/home_contract_card.dart';
import 'package:trana/view/authenticated/home_page/widgets/home_empty_state.dart';
import 'package:trana/view/authenticated/home_page/widgets/home_search_bar.dart';
import 'package:trana/view/authenticated/my_page/my_page.dart';
import 'package:trana/view/authenticated/notification_page/notification_page.dart';
import 'package:trana/view/modal/ai_autofill_notice_dialog/ai_autofill_notice_dialog.dart';
import 'package:trana/view/modal/guardian_identity_verify_dialog/guardian_identity_verify_dialog.dart';

class HomePage extends HookConsumerWidget {
  final bool showGuardianDialog;
  const HomePage({super.key, this.showGuardianDialog = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState<int>(0);
    final hasContracts = useState<bool>(false);

    useEffect(() {
      if (showGuardianDialog) {
        Future.microtask(() {
          if (context.mounted) {
            showDialog(
              barrierColor: Colors.black.withValues(alpha: 0.75),
              context: context,
              builder: (context) => const GuardianIdentityVerifyDialog(),
            );
          }
        });
      }
      return null;
    }, []);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: vrc(context).background,
      body: SafeArea(
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
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "거래 내역 관리",
                              style: TextStyle(
                                color: vrc(context).textSecondary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
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
                          onTap: () {},
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
                child: Stack(
                  children: [
                    Container(
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
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 22),

                          if (!hasContracts.value)
                            const HomeEmptyState()
                          else ...[
                            HomeContractCard(
                              roleLabel: "판매",
                              statusLabel: "서명 요청",
                              statusColor: fxc(context).statusSignRequest!,
                              itemName: "Sony Headphones",
                              price: "1,200,000원",
                              date: "2025-01-10",
                              onTap: () {},
                            ),
                            const SizedBox(height: 10),
                            HomeContractCard(
                              roleLabel: "판매",
                              statusLabel: "서명 완료",
                              statusColor: fxc(context).statusSignSuccess!,
                              itemName: "MacBook Air M2",
                              price: "1,200,000원",
                              date: "2025-01-10",
                              onTap: () {},
                            ),
                            const SizedBox(height: 10),
                            HomeContractCard(
                              roleLabel: "판매",
                              statusLabel: "거래 완료",
                              statusColor: fxc(context).brandColor!,
                              itemName: "Vintage Camera",
                              price: "1,200,000원",
                              date: "2025-01-10",
                              onTap: () {},
                            ),
                          ],
                        ],
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: HomeBottomNav(
                        currentIndex: currentIndex.value,
                        onIndexChanged: (index) => currentIndex.value = index,
                        customOnTaps: {
                          // ✅ 계약 작성 (기존 유지)
                          1: () {
                            currentIndex.value = 1;
                            showDialog(
                              context: context,
                              barrierColor: const Color(
                                0xFF000000,
                              ).withValues(alpha: 0.75),
                              builder: (context) =>
                                  const AiAutofillNoticeDialog(),
                            ).then((_) {
                              currentIndex.value = 0;
                            });
                          },

                          2: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyPage(),
                              ),
                            );
                          },
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
