import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/features/contract/presentation/widgets/modals/guardian_identity_verify_dialog.dart';
import 'package:trana/features/guardian/domain/entities/guardian_verification_state.dart';
import 'package:trana/features/guardian/presentation/viewmodels/guardian_verification_state_provider.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';
import 'package:trana/features/guardian/presentation/widgets/guardian_verification_banner.dart';
import 'package:trana/features/profile/presentation/screens/home/home_page.dart';

/// 홈 + 미성년자 보호자 인증 오버레이 (Stack 래핑 + 상태기반 노출)
/// TODO: 홈화면 코드랑 merge시 합쳐져야함. 배너 2개일때도 고려해야함
class HomeWithGuardianPage extends HookConsumerWidget {
  const HomeWithGuardianPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final me = ref.watch(meProvider).value;
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

    // 진행중(pending) / 완료(verified) 일 때만 하단 고정 배너
    final showBanner =
        isMinor &&
        (state == GuardianVerificationState.pending ||
            state == GuardianVerificationState.verified);
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Stack(
      children: [
        const HomePage(),
        if (showBanner)
          Positioned(
            left: 20,
            right: 20,
            bottom: 70 + bottomInset + 10,
            child: GuardianVerificationBanner(
              verified: state == GuardianVerificationState.verified,
              onTap: () => context.push(AppRoutes.guardianWaiting),
            ),
          ),
      ],
    );
  }
}
