import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/data/services/one_time_flag_service.dart';
import 'package:trana/features/guardian/presentation/viewmodels/guardian_verification_state_provider.dart';
import 'package:trana/features/guardian/presentation/viewmodels/guardian_view_model.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';

/// 대리인 인증 완료를 polling하며 대기하는 화면
class GuardianVerifyWaitingPage extends HookConsumerWidget {
  const GuardianVerifyWaitingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(guardianViewModelProvider); // auto-dispose 방지

    // 배너에서 이미 인증 완료 상태로 진입했다면(= meProvider 캐시에 반영됨)
    // "진행 중" 화면을 거치지 않고 바로 완료 상태로 시작
    final alreadyVerified =
        ref.read(meProvider).value?.guardianVerifiedAt != null;
    final isCompleted = useState(alreadyVerified);
    final currentStep = useState(alreadyVerified ? 3 : 2);
    final lifecycle = useAppLifecycleState();

    useEffect(() {
      final notifier = ref.read(guardianViewModelProvider.notifier);
      final inForeground =
          lifecycle == null || lifecycle == AppLifecycleState.resumed;
      // 포그라운드 & 미완료일 때만 폴링 (백그라운드로 가서 중단되면 복귀 시 재개)
      if (inForeground && !isCompleted.value) {
        notifier.startPolling(
          onComplete: () {
            if (context.mounted) {
              isCompleted.value = true;
              currentStep.value = 3;
            }
          },
        );
      } else {
        notifier.stopPolling();
      }
      return () => notifier.stopPolling();
    }, [lifecycle, isCompleted.value]);

    const int totalStep = 3;
    final double progress = currentStep.value / totalStep;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = screenWidth * progress;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "법정대리인 인증",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontFamily: "PretendardBold",
          ),
        ),
        backgroundColor: vrc(context).background,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 4,
              width: barWidth,
              color: fxc(context).brandColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                isCompleted.value ? "인증 완료!" : "인증 진행 중...",
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 20,
                  fontFamily: "PretendardBold",
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                isCompleted.value
                    ? "이제 법정대리인의 동의 하에\n안전하게 계약을 생성할 수 있어요."
                    : "보호자분께서 본인 인증을 진행하고 있어요.\n완료되면 알림을 보내드릴게요.",
                style: TextStyle(
                  color: vrc(context).textSecondary,
                  fontSize: 15,
                  fontFamily: "PretendardMedium",
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Align(
                alignment: const Alignment(0, -0.1),
                child: isCompleted.value
                    ? Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: fxc(context).subtitleGreen,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          color: fxc(context).brandColor,
                          size: 46,
                        ),
                      )
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          fxc(context).brandColor!,
                        ),
                        strokeWidth: 4.5,
                      ),
              ),
            ),
            PrimaryButton.brand(
              text: "완료",
              disabled: !isCompleted.value,
              onTap: () async {
                // guardian 플래그 설정
                final publicCode = ref.read(meProvider).value?.publicCode;
                if (publicCode != null) {
                  await OneTimeFlagService.mark(
                    OneTimeFlag.guardian,
                    publicCode,
                  );
                  ref.invalidate(guardianBannerAckedProvider);
                }
                if (context.mounted) context.go(AppRoutes.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
