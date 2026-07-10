import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/data/services/pending_invitation_token_service.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/receive_contract_view_model.dart';
// 테스트 유저 로그인
// import 'package:trana/features/profile/presentation/viewmodels/test_user_provider.dart';
import 'package:trana/features/contract/presentation/widgets/modals/guardian_identity_verify_dialog.dart';
import 'package:trana/features/guardian/domain/entities/guardian_verification_state.dart';
import 'package:trana/features/guardian/presentation/viewmodels/guardian_verification_state_provider.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_banner.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_bottom_nav.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_main_view.dart';
import 'package:trana/features/profile/presentation/screens/my_page/my_page.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';

class HomePage extends HookConsumerWidget {
  final bool showGuardianDialog;
  const HomePage({super.key, this.showGuardianDialog = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState<int>(0);
    final pages = [const HomeMainView(), const HomeMainView(), const MyPage()];
    final isMypage = currentIndex.value == 2;

    // ===== 인증 관련 =====
    final me = ref.read(meProvider).value;
    final isMinor = me?.ageGroup == 'MINOR';
    final state = ref.watch(guardianVerificationStateProvider).value;

    // 앱 재개 시 me/상태 1회 갱신
    // 백그라운드에서 보호자 인증 완료했을경우 감지하기 위해서
    final lifecycle = useAppLifecycleState();
    useEffect(() {
      if (lifecycle == AppLifecycleState.resumed) {
        ref.invalidate(meProvider);
      }
      return null;
    }, [lifecycle]);

    // 미발급,만료됐을경우 인증시작유도 안내팝업 1회 노출
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
        // 테스트 유저 로그인
        // final userVM = ref.read(testUserProvider.notifier);
        // await userVM.getUser();

        // 수신자 invitation 수락
        final receiveVM = ref.read(receiveContractViewModelProvider.notifier);
        final invitationToken = await PendingInvitationTokenService.get();
        if (invitationToken != null) {
          final acceptSuccess = await receiveVM.accept(invitationToken);
          if (!context.mounted) return;
          if (!acceptSuccess) {
            final state = ref.read(receiveContractViewModelProvider);
            showErrorToast(context, state.error!);
            receiveVM.clearError();
          }
        }

        // 사용자 동의 유형 정의
        final createVM = ref.read(createContractViewModelProvider.notifier);
        createVM.setUserConsentType(isMinor);

        // 내 계약 목록 조회
        final homeVM = ref.read(homeContractViewModelProvider.notifier);
        final readSuccess = await homeVM.readMyContracts();
        if (!context.mounted) return;
        if (!readSuccess) {
          final state = ref.read(homeContractViewModelProvider);
          showErrorToast(context, state.error!);
          homeVM.clearError();
        }
      });
      return null;
    }, []);

    return Scaffold(
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
    );
  }
}
