import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/constants/app_durations.dart';
import 'package:trana/core/providers/toast_visibility_provider.dart';
import 'package:trana/features/guardian/domain/entities/guardian_verification_state.dart';
import 'package:trana/features/guardian/presentation/viewmodels/guardian_verification_state_provider.dart';
import 'package:trana/features/guardian/presentation/widgets/guardian_verification_banner.dart';
import 'package:trana/features/profile/presentation/providers/banner_occupied_height_provider.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_contract_banner.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';

class HomeBanner extends HookConsumerWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ===== 계약 관련 =====
    final hasRequest = ref.watch(
      homeContractViewModelProvider.select(
        (s) => s.requestedContracts.isNotEmpty,
      ),
    );

    // ===== 인증 관련 =====
    final me = ref.read(meProvider).value;
    final isMinor = me?.ageGroup == 'MINOR';
    final state = ref.watch(guardianVerificationStateProvider).value;

    // guardian 플래그 설정 여부 확인 (대기 화면에서 invalidate되어 즉시 갱신됨)
    final guardianAcked = ref.watch(guardianBannerAckedProvider).value;

    // 진행중(pending)이면 항상, 완료(verified)면 guardian 플래그 미설정일 때만 하단 고정 배너
    final showBanner =
        isMinor &&
        guardianAcked != null &&
        (state == GuardianVerificationState.pending ||
            (state == GuardianVerificationState.verified && !guardianAcked));

    // 좌측 스와이프 시 일시적으로 숨김 (홈 화면 재진입 시 초기화)
    final isContractBannerDismissed = useState(false);
    final isGuardianBannerDismissed = useState(false);

    final showContractBanner = hasRequest && !isContractBannerDismissed.value;
    final showGuardianBanner = showBanner && !isGuardianBannerDismissed.value;

    final showToast = ref.watch(toastVisibilityProvider);
    final count = (showContractBanner ? 1 : 0) + (showGuardianBanner ? 1 : 0);
    final (:bottomOffset, :occupiedHeight) = BannerOccupiedHeight.calculate(
      showToast: showToast,
      bannerCount: count,
    );
    final toastProvider = ref.read(bannerOccupiedHeightProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        toastProvider.update(occupiedHeight);
      });
      return null;
    }, [occupiedHeight]);

    return AnimatedPositioned(
      duration: AppDurations.toggle,
      curve: Curves.easeOut,
      left: 20,
      right: 20,
      bottom: bottomOffset,
      child: AnimatedSize(
        duration: AppDurations.transition,
        curve: Curves.easeOut,
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            // 계약 배너
            if (showContractBanner)
              Dismissible(
                key: const ValueKey('home_contract_banner'),
                direction: DismissDirection.endToStart,
                onDismissed: (_) => isContractBannerDismissed.value = true,
                child: const HomeContractBanner(),
              ),
            // 인증 배너
            if (showGuardianBanner)
              Dismissible(
                key: const ValueKey('guardian_verification_banner'),
                direction: DismissDirection.endToStart,
                onDismissed: (_) => isGuardianBannerDismissed.value = true,
                child: const GuardianVerificationBanner(),
              ),
          ],
        ),
      ),
    );
  }
}
