import 'package:dio/dio.dart';
import 'package:trana/core/network/auth_token_store.dart';

/// 인증 인터셉터
/// 1. 모든 요청에 Authorization 자동 부착
/// 2. 401(AUTH_401/AUTH_401_TOKEN) 시 refresh 후 원요청 재시도
/// 3. refresh 실패 시 토큰 정리. GoRouter가 반응해서 재로그인 화면으로 이동
class AuthInterceptor extends QueuedInterceptor {
  final AuthTokenStore _store;

  /// 인터셉터가 없는 전용 인스턴스
  /// refresh 호출 + 재시도 용도 (무한루프 방지)
  final Dio _bareDio;

  AuthInterceptor(this._store, this._bareDio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _store.accessToken;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final res = err.response;
    final code = (res?.data is Map)
        ? (res!.data as Map)['code'] as String?
        : null;
    final is401 = res?.statusCode == 401;
    final retried = err.requestOptions.extra['__retried'] == true;
    final isRefreshCall = err.requestOptions.path.contains('/auth/refresh');

    final shouldRefresh =
        is401 &&
        (code == 'AUTH_401' || code == 'AUTH_401_TOKEN') &&
        !retried &&
        !isRefreshCall;

    if (shouldRefresh) {
      final refreshed = await _tryRefresh();
      if (refreshed) {
        // 새 토큰으로 원요청 1회 재시도 (재귀 방지를 위해 인터셉터 없는 _bareDio로 시도
        try {
          final req = err.requestOptions
            ..extra['__retried'] = true
            ..headers['Authorization'] = 'Bearer ${_store.accessToken}';
          return handler.resolve(await _bareDio.fetch(req));
        } catch (_) {
          return handler.next(err);
        }
      } else {
        // refresh 실패(만료/위변조)시 세션 정리, 라우터가 intro로 redirect
        await _store.clear();
      }
    }
    handler.next(err);
  }

  /// refreshToken으로 토큰 재발급. 성공 시 저장소 갱신
  Future<bool> _tryRefresh() async {
    final refreshToken = _store.refreshToken;
    if (refreshToken == null || refreshToken.isEmpty) return false;
    try {
      final res = await _bareDio.post(
        '/v1/auth/refresh',
        data: {'refreshToken': refreshToken},
      );
      final data = res.data as Map<String, dynamic>;
      _store.accessToken = data['accessToken'] as String?;
      _store.refreshToken = data['refreshToken'] as String?;
      return _store.isLoggedIn;
    } catch (_) {
      return false;
    }
  }
}
