import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

class ProfileScoreCard extends StatelessWidget {
  const ProfileScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "트라나",
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.verified, color: fxc(context).brandColor, size: 18),
              const SizedBox(width: 4),
              Text(
                "신원 인증 완료",
                style: TextStyle(
                  color: fxc(context).brandColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "신뢰 점수",
                style: TextStyle(
                  color: vrc(context).textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "85",
                      style: TextStyle(
                        color: vrc(context).textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: " / 100",
                      style: TextStyle(
                        color: vrc(context).textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.85,
              backgroundColor: vrc(context).tertiaryColor,
              valueColor: AlwaysStoppedAnimation<Color>(fxc(context).brandColor!),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}