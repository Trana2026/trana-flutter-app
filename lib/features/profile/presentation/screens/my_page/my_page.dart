import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/utils/date_time_extensions.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/confirm_action_dialog.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/data/services/one_time_flag_service.dart';
import 'package:trana/features/contract/domain/enums/age_group.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/my_page_menu_item.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/profile_score_card.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/section_card.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/trailing_language_dropdown.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/trailing_push_toggle.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/trailing_verify_status.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/trust_report_card.dart';
import 'package:trana/features/profile/presentation/viewmodels/device_token_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/my_page_view_model.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';

class MyPage extends HookConsumerWidget {
  const MyPage({super.key, required this.isPending});

  final ValueNotifier<bool> isPending;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeContractViewModelProvider);
    final mypageState = ref.watch(myPageViewModelProvider);
    final mypageVM = ref.read(myPageViewModelProvider.notifier);
    final deviceState = ref.watch(deviceTokenViewModelProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // 마이페이지 정보 로드
        final success = await mypageVM.loadData();
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(myPageViewModelProvider);
          showErrorToast(context, state.error!);
          mypageVM.clearError();
        }
      });
      return null;
    }, []);

    final currentDevice = mypageState.devices
        .where((d) => d.id == deviceState.currentDeviceId)
        .firstOrNull;

    return Scaffold(
      backgroundColor: vrc(context).secondaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const ProfileScoreCard(),
            const SizedBox(height: 16),
            const TrustReportCard(),

            SectionCard(
              title: "나의 계약",
              children: [
                MyPageMenuItem(
                  appIcon: AppIcon.data(icon: CooliconsIcon.fileBlank),
                  label: "총 계약 내역",
                  trailingText: "${homeState.myContracts.length}건",
                  onTap: () => context.push(AppRoutes.totalContract),
                ),
                MyPageMenuItem(
                  appIcon: AppIcon.svg(asset: 'assets/icons/file_warning.svg'),
                  label: "미체결 계약",
                  trailingText: "${homeState.pendingContracts.length}건",
                  onTap: () => context.push(AppRoutes.pendingContract),
                ),
                MyPageMenuItem(
                  appIcon: AppIcon.data(icon: CooliconsIcon.triangleWarning),
                  label: "신고 / 분쟁 내역",
                  trailingText: "${homeState.disputingContracts.length}건",
                  onTap: () => context.push(AppRoutes.disputeContract),
                ),
              ],
            ),

            SectionCard(
              title: "인증하기",
              children: [
                MyPageMenuItem(
                  appIcon: AppIcon.data(icon: CooliconsIcon.circleCheck),
                  label: "본인 인증",
                  customTrailing: TrailingVerifyStatus(
                    verified: mypageState.userVerified,
                  ),
                ),
                if (mypageState.ageGroup == AgeGroup.minor)
                  MyPageMenuItem(
                    appIcon: AppIcon.svg(
                      asset: 'assets/icons/shield_warning.svg',
                    ),
                    label: "법정대리인 인증",
                    customTrailing: TrailingVerifyStatus(
                      verified: mypageState.guardianVerifiedAt != null,
                    ),
                  ),
              ],
            ),

            SectionCard(
              title: "보안 관리",
              children: [
                MyPageMenuItem(
                  appIcon: AppIcon.data(icon: CooliconsIcon.mobileButton),
                  label: "로그인 기기 관리",
                  trailingText: "${mypageState.devices.length}대",
                  onTap: () => context.push(AppRoutes.deviceManage),
                ),
                MyPageMenuItem(
                  appIcon: AppIcon.data(icon: Icons.access_time),
                  label: "최근 로그인 기록",
                  trailingText: (currentDevice?.lastUsedAt).timeAgo,
                  showChevron: false,
                ),
              ],
            ),

            SectionCard(
              title: "고객 지원",
              children: [
                MyPageMenuItem(
                  appIcon: AppIcon.data(icon: CooliconsIcon.bell),
                  label: "공지사항",
                  onTap: () => context.push(AppRoutes.notification),
                ),
                MyPageMenuItem(
                  appIcon: AppIcon.data(icon: CooliconsIcon.circleHelp),
                  label: "고객 센터",
                  onTap: () => context.push(AppRoutes.customerService),
                ),
                MyPageMenuItem(
                  appIcon: AppIcon.svg(asset: 'assets/icons/file_help.svg'),
                  label: "문의 내역 관리",
                  onTap: () => context.push(AppRoutes.inquiryHistory),
                ),
                MyPageMenuItem(
                  appIcon: AppIcon.svg(asset: 'assets/icons/file.svg'),
                  label: "약관 및 정책",
                  onTap: () => context.push(AppRoutes.policyList),
                ),
              ],
            ),

            SectionCard(
              title: "계정 관리",
              children: [
                MyPageMenuItem(
                  appIcon: AppIcon.data(icon: CooliconsIcon.bell),
                  label: "푸시 알림 설정",
                  customTrailing: const TrailingPushToggle(),
                ),
                MyPageMenuItem(
                  appIcon: AppIcon.data(icon: CooliconsIcon.user01),
                  label: "개인정보 관리",
                  onTap: () => context.push(AppRoutes.editProfile),
                ),
                MyPageMenuItem(
                  appIcon: AppIcon.data(icon: CooliconsIcon.globe),
                  label: "언어 설정",
                  customTrailing: const TrailingLanguageDropdown(),
                ),
                MyPageMenuItem(
                  appIcon: AppIcon.data(icon: Icons.logout),
                  label: "로그아웃",
                  onTap: () => _onLogout(context, ref, isPending),
                ),
                MyPageMenuItem(
                  appIcon: AppIcon.data(icon: CooliconsIcon.trashFull),
                  label: "탈퇴하기",
                  onTap: () => _onWithdraw(context, ref, isPending),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 로그아웃. 토큰/보호자링크 정리 후 intro로 이동
  Future<void> _onLogout(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> isPending,
  ) async {
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
    if (isPending.value) return;
    isPending.value = true;
    try {
      // 로그아웃 시 FCM 디바이스 토큰 해제
      final deviceVM = ref.read(deviceTokenViewModelProvider.notifier);
      final success = await deviceVM.deleteToken();
      if (!context.mounted) return;
      if (!success) {
        final state = ref.read(deviceTokenViewModelProvider);
        showErrorToast(context, state.error!);
        deviceVM.clearError();
      }

      await ref.read(authRepositoryProvider).signOut();
      await ref.read(guardianLinkStoreProvider).clear();
      ref.invalidate(meProvider);
      if (context.mounted) context.go(AppRoutes.intro);
    } finally {
      isPending.value = false;
    }
  }

  /// 회원탈퇴 (DELETE /v1/users/me). 토큰/보호자링크 정리 후 intro로 이동
  Future<void> _onWithdraw(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> isPending,
  ) async {
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
    if (isPending.value) return;
    isPending.value = true;
    try {
      final result = await ref.read(authRepositoryProvider).deleteAccount();
      if (!context.mounted) return;
      if (result.isSuccess) {
        // 탈퇴 시 플래그 삭제
        final publicCode = ref.read(meProvider).value?.publicCode;
        if (publicCode != null) {
          await OneTimeFlagService.clearForUser(publicCode);
        }

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
    } finally {
      isPending.value = false;
    }
  }
}
