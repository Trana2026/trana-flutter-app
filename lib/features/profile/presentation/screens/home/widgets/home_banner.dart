import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/features/guardian/domain/entities/guardian_verification_state.dart';
import 'package:trana/features/guardian/presentation/viewmodels/guardian_verification_state_provider.dart';
import 'package:trana/features/guardian/presentation/widgets/guardian_verification_banner.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_contract_banner.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';

class HomeBanner extends HookConsumerWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ===== 계약 관련 =====
    final homeState = ref.watch(homeContractViewModelProvider);
    final hasRequest = homeState.requestedContracts.isNotEmpty;

    // ===== 인증 관련 =====
    final me = ref.read(meProvider).value;
    final isMinor = me?.ageGroup == 'MINOR';
    final state = ref.watch(guardianVerificationStateProvider).value;
    // 진행중(pending) / 완료(verified) 일 때만 하단 고정 배너
    final showBanner =
        isMinor &&
        (state == GuardianVerificationState.pending ||
            state == GuardianVerificationState.verified);

    return Positioned(
      left: 20,
      right: 20,
      bottom: 10,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            // 계약 배너
            if (hasRequest) const HomeContractBanner(),
            // 인증 배너
            if (showBanner) const GuardianVerificationBanner(),
          ],
        ),
      ),
    );
  }
}
