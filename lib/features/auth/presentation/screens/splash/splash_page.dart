import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/features/auth/presentation/screens/splash/widgets/splash_glow_background.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';
// import 'package:trana/core/dev/test_user_provider.dart';

/// 앱 시작 시 3초 후 인트로 화면으로 자동 이동하는 스플래시 화면
class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      () async {
        // 재진입. 저장된 토큰 있으면 홈으로, 없으면 intro로 이동
        final token = ref.read(authTokenStoreProvider).accessToken;
        final loggedIn = token != null && token.isNotEmpty;

        // 홈 화면 진입 전에 로그인(사용자 정보) 조회를 스플래시 대기 시간 동안 미리 끝냄
        // 서버 콜드스타트 등으로 로그인 지연 시에도, 홈 페이지로 진입되지 않고 스플래시 페이지에서 대기
        final prefetchMe = loggedIn
            ? ref.read(meProvider.future).catchError((_) => null)
            : Future<void>.value();

        await Future.wait<Object?>([
          Future.delayed(const Duration(seconds: 3)),
          prefetchMe,
        ]);

        if (!context.mounted) return;
        context.go(loggedIn ? AppRoutes.home : AppRoutes.intro);
      }();

      return null;
    }, const []);

    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 코너 글로우 배경
          const SplashGlowBackground(),
          // 심볼 + 워드마크 (중앙보다 살짝 위)
          const Align(alignment: Alignment(0, -0.058), child: _SplashLogo()),
        ],
      ),
    );
  }
}

/// 스플래시 중앙 로고 심볼과 Trana 워드마크
class _SplashLogo extends StatelessWidget {
  const _SplashLogo();

  @override
  Widget build(BuildContext context) {
    // 피그마 프레임 width(375) 대비 비례 스케일
    final s = MediaQuery.sizeOf(context).width / 375;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/splash_symbol.png",
          width: 100 * s,
          height: 100 * s,
        ),
        SizedBox(height: 8 * s),
        Text(
          "Trana",
          style: TextStyle(
            color: const Color(0xFF40C572),
            fontFamily: "PretendardExtraBold",
            fontSize: 20 * s,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
