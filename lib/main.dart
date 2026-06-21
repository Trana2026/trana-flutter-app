import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // .env 로드 (pubspec assets 번들). 이후 dotenv.env['KEY']로 접근
  await dotenv.load(fileName: '.env');

  // 카카오 SDK 초기화
  KakaoSdk.init(
    nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY'] ?? '',
  );

  // 구글 로그인 초기화 (serverClientId=백엔드 검증용 웹 클라ID, clientId=iOS 클라ID)
  final googleServerClientId = dotenv.env['GOOGLE_SERVER_CLIENT_ID'] ?? '';
  final googleIosClientId = dotenv.env['GOOGLE_IOS_CLIENT_ID'] ?? '';
  if (googleServerClientId.isNotEmpty) {
    await GoogleSignIn.instance.initialize(
      serverClientId: googleServerClientId,
      clientId: googleIosClientId.isEmpty ? null : googleIosClientId,
    );
  }

  // 저장된 토큰을 secure storage에서 복원한 뒤 앱 시작 (재진입 라우팅 대비)
  final container = ProviderContainer();
  await container.read(authTokenStoreProvider).load();

  // 토큰 저장소를 라우터에 연결. 세션 만료(토큰 clear) 시 자동 redirect
  final router = createAppRouter(container.read(authTokenStoreProvider));

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: TranaApp(router: router),
    ),
  );
}

class TranaApp extends StatelessWidget {
  final GoRouter router;
  const TranaApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
