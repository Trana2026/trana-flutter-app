import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

class ProfileScoreCard extends StatelessWidget {
  const ProfileScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "트라나",
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 22,
                  fontFamily: "PretendardBold",
                  letterSpacing: -0.2
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(left: 0.5),
                child: Row(
                  children: [
                    Icon(
                      Icons.shield_rounded,
                      color: fxc(context).brandColor,
                      size: 18,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "신원 인증 완료",
                      style: TextStyle(
                        color: fxc(context).brandColor,
                        fontSize: 13,
                        fontFamily: "PretendardMedium",
                        letterSpacing: -0.2
                      ),
                    ),
                  ],
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
                  color: vrc(context).textPrimary,
                  fontSize: 16,
                  fontFamily: "PretendardMedium",
                  letterSpacing: -0.2
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "85",
                      style: TextStyle(
                        color: vrc(context).textPrimary,
                        fontSize: 20,
                        fontFamily: "PretendardSemiBold"
                      ),
                    ),
                    TextSpan(
                      text: " / 100",
                      style: TextStyle(
                        color: vrc(context).textPrimary,
                        fontFamily: "PretendardMedium",
                        fontSize: 16,
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
              backgroundColor: vrc(context).secondaryColor,
              valueColor: AlwaysStoppedAnimation<Color>(
                fxc(context).brandColor!,
              ),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
