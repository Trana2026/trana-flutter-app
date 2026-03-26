import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/my_page/widgets/my_page_menu_item.dart';
import 'package:trana/view/authenticated/my_page/widgets/profile_score_card.dart';
import 'package:trana/view/authenticated/my_page/widgets/section_title.dart';
import 'package:trana/view/authenticated/my_page/widgets/trust_report_card.dart';
import 'package:trana/view/authenticated/my_page/widgets/section_card.dart'; // 추가 필요

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vrc(context).background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          children: const [
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
                ),
                MyPageMenuItem(
                  icon: Icons.error_outline,
                  title: "미체결 계약",
                  trailing: "1건",
                ),
                MyPageMenuItem(
                  icon: Icons.report_problem_outlined,
                  title: "신고 / 분쟁 내역",
                  trailing: "1건",
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
                MyPageMenuItem(icon: Icons.notifications_none, title: "공지사항"),
                MyPageMenuItem(icon: Icons.help_outline, title: "고객 센터"),
                MyPageMenuItem(icon: Icons.contact_support_outlined, title: "문의 내역 관리"),
                MyPageMenuItem(icon: Icons.article_outlined, title: "약관 및 정책"),
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
                MyPageMenuItem(icon: Icons.person_outline, title: "개인정보 관리"),
                MyPageMenuItem(icon: Icons.language, title: "언어 설정"),
                MyPageMenuItem(icon: Icons.logout, title: "로그아웃"),
                MyPageMenuItem(icon: Icons.delete_outline, title: "탈퇴하기"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
