import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/profile/presentation/viewmodels/my_page_view_model.dart';

class ProfileScoreCard extends HookConsumerWidget {
  const ProfileScoreCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mypageState = ref.watch(myPageViewModelProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mypageState.name,
            style: context.txt(
              color: vrc(context).textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.shield_rounded,
                size: 16,
                color: mypageState.userVerified
                    ? fxc(context).brandColor
                    : vrc(context).textTertiary,
              ),
              const SizedBox(width: 4),
              Text(
                mypageState.userVerified ? "신원 인증 완료" : "신원 인증 미완료",
                style: context.txt(
                  color: mypageState.userVerified
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
                mypageState.trustScore.toString(),
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
                    value: mypageState.trustScore / 100,
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
