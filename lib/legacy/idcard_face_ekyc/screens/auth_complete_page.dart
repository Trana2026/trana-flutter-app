import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/constants/app_dimens.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';

/// 본인 인증 완료 안내 화면
class AuthCompletePage extends HookConsumerWidget {
  const AuthCompletePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = context.designScale;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: vrc(context).background,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20 * s,
            color: vrc(context).iconPrimary,
          ),
          onPressed: () => context.go(AppRoutes.home),
        ),
        title: Text(
          "본인 인증",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 16 * s,
            fontFamily: "PretendardBold",
            letterSpacing: -0.16 * s,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4 * s),
          child: Container(height: 4 * s, color: fxc(context).brandColor),
        ),
      ),
      body: Stack(
        children: [
          // 상단 안내문
          Padding(
            padding: EdgeInsets.fromLTRB(20 * s, 24 * s, 20 * s, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "인증 완료!",
                  style: TextStyle(
                    color: vrc(context).textPrimary,
                    fontSize: 20 * s,
                    fontFamily: "PretendardBold",
                    letterSpacing: -0.20 * s,
                  ),
                ),
                SizedBox(height: 6 * s),
                Text(
                  "본인 인증이 완료되었어요!\n이제 안전한 계약을 생성하러 갈까요?",
                  style: TextStyle(
                    color: vrc(context).textSecondary,
                    fontSize: 14 * s,
                    fontFamily: "PretendardMedium",
                    height: 1.5,
                    letterSpacing: -0.14 * s,
                  ),
                ),
              ],
            ),
          ),

          // 완료 체크 표시
          Align(
            alignment: const Alignment(0, -0.05),
            child: Container(
              width: 80 * s,
              height: 80 * s,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: fxc(context).subtitleGreen,
              ),
              child: Icon(
                Icons.check_rounded,
                size: 44 * s,
                color: fxc(context).brandColor,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(20 * s, 0, 20 * s, 16 * s),
        child: Material(
          color: fxc(context).brandColor,
          borderRadius: BorderRadius.circular(16 * s),
          child: InkWell(
            borderRadius: BorderRadius.circular(16 * s),
            onTap: () => context.go(AppRoutes.home),
            child: SizedBox(
              width: double.infinity,
              height: 52 * s,
              child: Center(
                child: Text(
                  "홈으로 이동하기",
                  style: TextStyle(
                    color: fxc(context).textBrand,
                    fontSize: 16 * s,
                    fontFamily: "PretendardSemiBold",
                    letterSpacing: -0.16 * s,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
