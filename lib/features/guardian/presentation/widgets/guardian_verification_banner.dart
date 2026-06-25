import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/guardian/domain/entities/guardian_verification_state.dart';
import 'package:trana/features/guardian/presentation/viewmodels/guardian_verification_state_provider.dart';

/// 홈 하단 고정 보호자 인증 상태 배너. 탭 시 대기 화면 이동
class GuardianVerificationBanner extends HookConsumerWidget {
  const GuardianVerificationBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(guardianVerificationStateProvider).value;
    final bool verified = state == GuardianVerificationState.verified;

    final title = verified ? "법정대리인 인증이 완료되었어요!" : "법정대리인 인증이 아직 진행 중이에요";
    final subtitle = verified ? "이제 안전하게 계약을 생성할 수 있어요." : "완료되면 알림을 보내드릴게요.";

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.push(AppRoutes.guardianWaiting),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: fxc(context).opacityBg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              _leading(context, verified),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.txt(color: fxc(context).textBrand),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: context.txt(
                        color: fxc(context).textBrand,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                CooliconsIcon.chevronRight,
                size: 24,
                color: fxc(context).textBrand,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 좌측 아이콘.
  /// 진행중은 스피너, 완료는 초록 체크
  Widget _leading(BuildContext context, bool verified) {
    if (verified) {
      return Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fxc(context).brandColor,
        ),
        child: Icon(
          CooliconsIcon.check,
          color: fxc(context).textBrand,
          size: 20,
        ),
      );
      // return Icon(Icons.check_circle, size: 24, color: fxc(context).brandColor);
    }
    return SizedBox(
      width: 22,
      height: 22,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: fxc(context).brandColor,
      ),
    );
  }
}
