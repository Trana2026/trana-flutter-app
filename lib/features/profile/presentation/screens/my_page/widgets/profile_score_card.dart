import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/profile/presentation/viewmodels/my_page_view_model.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';

class ProfileScoreCard extends HookConsumerWidget {
  const ProfileScoreCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shareCode = ref.watch(meProvider).value?.shareCode;
    final (name, userVerified, trustScore) = ref.watch(
      myPageViewModelProvider.select(
        (s) => (s.name, s.userVerified, s.trustScore),
      ),
    );

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: context.txt(
                    color: vrc(context).textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // meProvider 로딩 전이면 null이므로 이 경우에만 코드 미표시
              if (shareCode != null) ...[
                const SizedBox(width: 10),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: shareCode));
                    showNormalToast(context, "고유코드가 복사되었습니다");
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: vrc(context).tertiaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      shareCode,
                      style: context.txt(
                        color: vrc(context).textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.shield_rounded,
                size: 16,
                color: userVerified
                    ? fxc(context).brandColor
                    : vrc(context).textTertiary,
              ),
              const SizedBox(width: 4),
              Text(
                userVerified ? "신원 인증 완료" : "신원 인증 미완료",
                style: context.txt(
                  color: userVerified
                      ? fxc(context).brandColor
                      : vrc(context).textTertiary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "신뢰 점수",
                style: context.txt(color: vrc(context).textPrimary),
              ),
              const Spacer(),
              Text(
                trustScore.toString(),
                style: context.txt(
                  color: vrc(context).textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                "/ 100",
                style: context.txt(color: vrc(context).textPrimary),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Stack(
              children: [
                LinearProgressIndicator(
                  value: 0,
                  minHeight: 8,
                  backgroundColor: vrc(context).secondaryColor!,
                ),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      fxc(context).brandColor!,
                      fxc(context).trustScore!,
                    ],
                  ).createShader(bounds),
                  child: LinearProgressIndicator(
                    value: trustScore / 100,
                    minHeight: 8,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
