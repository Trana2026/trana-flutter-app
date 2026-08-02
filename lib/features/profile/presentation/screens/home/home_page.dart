import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/pending_overlay.dart';
import 'package:trana/features/contract/data/services/pending_contract_code_service.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/viewmodels/cancel_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/report_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/guardian_identity_verify_dialog.dart';
import 'package:trana/features/guardian/domain/entities/guardian_verification_state.dart';
import 'package:trana/features/guardian/presentation/viewmodels/guardian_verification_state_provider.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_banner.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_bottom_nav.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_main_view.dart';
import 'package:trana/features/profile/presentation/screens/my_page/my_page.dart';
import 'package:trana/features/profile/presentation/viewmodels/device_token_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';

class HomePage extends HookConsumerWidget {
  final bool showGuardianDialog;
  const HomePage({super.key, this.showGuardianDialog = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState<int>(0);
    final isPending = useState(false);
    final pages = [
      HomeMainView(isPending: isPending),
      HomeMainView(isPending: isPending),
      MyPage(isPending: isPending),
    ];
    final isMypage = currentIndex.value == 2;

    // ===== 인증 관련 =====
    final me = ref.read(meProvider).value;
    final isMinor = me?.ageGroup == 'MINOR';
    final state = ref.watch(guardianVerificationStateProvider).value;

    // 앱 재개 시 me/상태 1회 갱신
    // 백그라운드에서 보호자 인증 완료했을 경우 감지하기 위함
    final lifecycle = useAppLifecycleState();
    useEffect(() {
      if (lifecycle == AppLifecycleState.resumed) {
        ref.invalidate(meProvider);
      }
      return null;
    }, [lifecycle]);

    // 미발급, 만료됐을경우 인증시작 유도 팝업 1회 노출
    final shouldPrompt =
        isMinor &&
        (state == GuardianVerificationState.notIssued ||
            state == GuardianVerificationState.expired);
    final promptShown = useRef(false);
    useEffect(() {
      if (shouldPrompt && !promptShown.value) {
        promptShown.value = true;
        Future.microtask(() {
          if (!context.mounted) return;
          showDialog(
            context: context,
            barrierColor: Colors.black.withValues(alpha: 0.6),
            builder: (_) => const GuardianIdentityVerifyDialog(),
          );
        });
      }
      return null;
    }, [shouldPrompt]);

    // ===== 계약 관련 =====
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        /* 초대(invitation) 수락 흐름 : 계약 요청이 고유코드방식으로 변경됨에 따라 미사용
        
        // 플레이스토어 설치 유입 시 Install Referrer에서 초대 토큰 복구
        await DeferredLinkService.restoreInvitationToken();
        
        // 수신자 invitation 수락
        final receiveVM = ref.read(receiveContractViewModelProvider.notifier);
        final acceptSuccess = await receiveVM.accept();
        if (!context.mounted) return;
        if (!acceptSuccess) {
          final state = ref.read(receiveContractViewModelProvider);
          showErrorToast(context, state.error!);
          receiveVM.clearError();
        }
        */

        // 내 계약 목록 조회
        final homeVM = ref.read(homeContractViewModelProvider.notifier);
        final readSuccess = await homeVM.readMyContracts();
        if (!context.mounted) return;
        if (!readSuccess) {
          final state = ref.read(homeContractViewModelProvider);
          showErrorToast(context, state.error!);
          homeVM.clearError();
        }

        // 알림톡 딥링크로 수신한 계약코드가 있으면 상세로 이동
        await _consumePendingContractCode(context, ref);
      });
      return null;
    }, []);

    // ===== 기기/토큰 관련 =====
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // FCM 토큰 + 현재 기기 정보 식별
        final deviceVM = ref.read(deviceTokenViewModelProvider.notifier);
        await deviceVM.getDeviceInfo();

        // FCM 토큰 저장
        final registerSuccess = await deviceVM.registerToken();
        if (!context.mounted) return;
        if (!registerSuccess) {
          final state = ref.read(deviceTokenViewModelProvider);
          showErrorToast(context, state.error!);
          deviceVM.clearError();
        }

        // 기기 활성 ping
        final success = await deviceVM.ping();
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(deviceTokenViewModelProvider);
          showErrorToast(context, state.error!);
          deviceVM.clearError();
        }
      });
      return null;
    }, [lifecycle]);

    return PendingOverlay(
      isPending: isPending.value,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: isMypage
            ? vrc(context).secondaryColor
            : vrc(context).background,
        body: Stack(
          children: [
            IndexedStack(index: currentIndex.value, children: pages),
            if (!isMypage) const HomeBanner(),
          ],
        ),

        bottomNavigationBar: HomeBottomNav(
          currentIndex: currentIndex.value,
          onIndexChanged: (index) => currentIndex.value = index,
        ),
      ),
    );
  }

  /// 딥링크로 저장된 계약코드 사용 후 상세로 이동
  Future<void> _consumePendingContractCode(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final publicCode = await PendingContractCodeService.get();
    if (publicCode == null) return;
    await PendingContractCodeService.clear();

    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    final reportVM = ref.read(reportContractViewModelProvider.notifier);
    final cancelVM = ref.read(cancelContractViewModelProvider.notifier);

    final results = await Future.wait([
      detailVM.loadDetail(publicCode),
      reportVM.readReport(publicCode),
      cancelVM.readCancel(publicCode),
    ]);
    if (!context.mounted) return;

    // 본인 계약이 아니거나(403) 없는 계약(404)일 경우
    if (results.contains(false)) {
      final detailState = ref.read(detailContractViewModelProvider);
      showErrorToast(context, detailState.error ?? '계약을 불러오지 못했습니다.');
      detailVM.clearError();
      reportVM.clearError();
      cancelVM.clearError();
      return;
    }

    final detailState = ref.read(detailContractViewModelProvider);
    if (detailState.status == ContractStatus.inProgress ||
        detailState.status == ContractStatus.draft) {
      context.push(AppRoutes.contractDetail);
    } else {
      context.push(AppRoutes.biometricLock);
    }
  }
}
