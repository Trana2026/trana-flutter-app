import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/confirm_action_dialog.dart';
import 'package:trana/features/guardian/presentation/viewmodels/me_provider.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/customer_service_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/device_management_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/dispute_history_contract_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/inquiry_history_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/pending_contract_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/policy_list_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/profile_edit_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/total_contract_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/my_page_menu_item.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/profile_score_card.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/section_title.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/trust_report_card.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/section_card.dart';
import 'package:trana/features/notification/presentation/screens/notification/notification_page.dart'; // 추가 필요

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: vrc(context).secondaryColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
          children: [
            ProfileScoreCard(),
            SizedBox(height: 16),
            TrustReportCard(),

            // 1. 나의 계약 섹션
            SectionTitle(title: "나의 계약"),
            SectionCard(
              children: [
                MyPageMenuItem(
                  icon: Icons.description_outlined,
                  title: "총 계약 내역",
                  trailing: "3건",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TotalContractPage(),
                    ),
                  ),
                ),
                MyPageMenuItem(
                  icon: Icons.error_outline,
                  title: "미체결 계약",
                  trailing: "1건",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PendingContractPage(),
                    ),
                  ),
                ),
                MyPageMenuItem(
                  icon: Icons.report_problem_outlined,
                  title: "신고 / 분쟁 내역",
                  trailing: "1건",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisputeHistoryContractPage(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            // 2. 인증하기 섹션
            SectionTitle(title: "인증하기"),
            SectionCard(
              children: [
                MyPageMenuItem(
                  icon: Icons.check_circle_outline,
                  title: "KYC 인증",
                  statusText: "완료",
                  showChevron: false,
                ),
                MyPageMenuItem(
                  icon: Icons.security_outlined,
                  title: "법정대리인 인증",
                  statusText: "인증하기",
                  showChevron: false,
                ),
              ],
            ),
            SizedBox(height: 15),

            // 4. 보안 관리 섹션
            SectionTitle(title: "보안 관리"),
            SectionCard(
              children: [
                MyPageMenuItem(
                  icon: Icons.phone_android,
                  title: "로그인 기기 관리",
                  trailing: "2대",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeviceManagementPage(),
                    ),
                  ),
                ),
                MyPageMenuItem(
                  icon: Icons.access_time,
                  title: "최근 로그인 기록",
                  trailing: "2026.03.06,Seoul",
                  showChevron: false,
                ),
              ],
            ),
            SizedBox(height: 15),

            // 4. 고객 지원 섹션
            SectionTitle(title: "고객 지원"),
            SectionCard(
              children: [
                MyPageMenuItem(
                  icon: Icons.notifications_none,
                  title: "공지사항",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  ),
                ),
                MyPageMenuItem(
                  icon: Icons.help_outline,
                  title: "고객 센터",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerServicePage(),
                    ),
                  ),
                ),
                MyPageMenuItem(
                  icon: Icons.contact_support_outlined,
                  title: "문의 내역 관리",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InquiryHistoryPage(),
                    ),
                  ),
                ),
                MyPageMenuItem(
                  icon: Icons.article_outlined,
                  title: "약관 및 정책",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PolicyListPage()),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),

            // 5. 계정 관리 섹션
            SectionTitle(title: "계정 관리"),
            SectionCard(
              children: [
                MyPageMenuItem(
                  icon: Icons.notifications_none,
                  title: "푸시 알림 설정",
                  isSwitch: true,
                ),
                MyPageMenuItem(
                  icon: Icons.person_outline,
                  title: "개인정보 관리",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileEditPage()),
                  ),
                ),
                MyPageMenuItem(icon: Icons.language, title: "언어 설정"),
                MyPageMenuItem(
                  icon: Icons.logout,
                  title: "로그아웃",
                  onTap: () => _onLogout(context, ref),
                ),
                MyPageMenuItem(
                  icon: Icons.delete_outline,
                  title: "탈퇴하기",
                  onTap: () => _onWithdraw(context, ref),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 로그아웃. 토큰/보호자링크 정리 후 intro로 이동
  Future<void> _onLogout(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (_) => const ConfirmActionDialog(
        title: "로그아웃하면",
        message: "로그인이 필요한 기능들을 사용할 수 없어요.\n그래도 로그아웃하시겠어요?",
        confirmText: "로그아웃",
      ),
    );
    if (ok != true) return;
    await ref.read(authRepositoryProvider).signOut();
    await ref.read(guardianLinkStoreProvider).clear();
    ref.invalidate(meProvider);
    if (context.mounted) context.go(AppRoutes.intro);
  }

  /// 회원탈퇴 (DELETE /v1/users/me). 토큰/보호자링크 정리 후 intro로 이동
  Future<void> _onWithdraw(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (_) => const ConfirmActionDialog(
        title: "탈퇴하면",
        message: "탈퇴 시 모든 정보가 삭제되며 복구할 수 없어요.\n그래도 정말 탈퇴하시겠어요?",
        confirmText: "탈퇴하기",
      ),
    );
    if (ok != true) return;
    final result = await ref.read(authRepositoryProvider).deleteAccount();
    if (!context.mounted) return;
    if (result.isSuccess) {
      await ref.read(guardianLinkStoreProvider).clear();
      ref.invalidate(meProvider);
      if (context.mounted) context.go(AppRoutes.intro);
    } else {
      Fluttertoast.showToast(
        msg: result.failureOrNull?.message ?? "탈퇴에 실패했습니다. 잠시 후 다시 시도해 주세요.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: vrc(context).secondaryColor!,
        textColor: vrc(context).textPrimary!,
      );
    }
  }
}
