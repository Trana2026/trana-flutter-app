import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

/// 홈 하단 고정 보호자 인증 상태 배너. 탭 시 대기 화면 이동
class GuardianVerificationBanner extends StatelessWidget {
  final bool verified;
  final VoidCallback onTap;

  const GuardianVerificationBanner({
    super.key,
    required this.verified,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final title = verified ? "법정대리인 인증이 완료되었어요!" : "법정대리인 인증이 아직 진행 중이에요";
    final subtitle = verified ? "이제 안전하게 계약을 생성할 수 있어요." : "완료되면 알림을 보내드릴게요.";

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: vrc(context).secondaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              _leading(context),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: vrc(context).textSecondary,
                        fontSize: 14,
                        fontFamily: "PretendardBold",
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: vrc(context).textTertiary,
                        fontSize: 12,
                        fontFamily: "PretendardMedium",
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 22,
                color: vrc(context).textTertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 좌측 아이콘.
  /// 진행중은 스피너, 완료는 초록 체크
  Widget _leading(BuildContext context) {
    if (verified) {
      return Icon(Icons.check_circle, size: 24, color: fxc(context).brandColor);
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
