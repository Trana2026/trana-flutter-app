import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trana/core/config/app_config.dart';
import 'package:trana/core/network/auth_interceptor.dart';
import 'package:trana/core/network/auth_token_store.dart';

const _apiNames = {
  'GET /v1/ekyc/terms': '약관 목록 조회',
  'POST /v1/ekyc/consents': '약관동의',
  'POST /v1/ekyc/ocr': '신분증 OCR',
  'POST /v1/ekyc/verify': '신분증 진위확인',
  'POST /v1/ekyc/phone': '전화번호 기록',
  'POST /v1/ekyc/face': '얼굴 비교',
  'POST /v1/guardian/links': '보호자 링크 생성',
  'GET /v1/users/me': '유저 정보 조회',
};

String _apiName(String method, String path) {
  final key = '${method.toUpperCase()} $path';
  return _apiNames[key] ?? key;
}

class _ApiLogInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      final req = response.requestOptions;
      final name = _apiName(req.method, req.path);
      debugPrint('🌈 [$name 성공]\n${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      final req = err.requestOptions;
      final name = _apiName(req.method, req.path);
      debugPrint('❌ [$name 실패]\n${err.response?.data ?? err.message}');
    }
    super.onError(err, handler);
  }
}

/// 기기 식별 User-Agent를 요청 헤더에 주입 (최초 1회 계산 후 캐시)
class _UserAgentInterceptor extends Interceptor {
  _UserAgentInterceptor(this._builder);

  final Future<String> Function() _builder;
  String? _cached;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _cached ??= await _builder();
    options.headers['User-Agent'] = _cached;
    handler.next(options);
  }
}

/// Dio 인스턴스 생성.
/// base URL, timeout, 인증 인터셉터 적용
/// [userAgentBuilder] 지정 시 기기 식별 User-Agent를 요청에 주입
Dio createDio(
  AuthTokenStore tokenStore, {
  Future<String> Function()? userAgentBuilder,
}) {
  final options = BaseOptions(
    baseUrl: AppConfig.apiBaseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 30),
    headers: {'Content-Type': 'application/json'},
  );

  // 인터셉터 없는 전용 인스턴스 (refresh 호출 + 재시도)
  // 인증 인터셉터 재귀 방지
  final bareDio = Dio(options)..interceptors.add(_ApiLogInterceptor());

  final dio = Dio(options)
    ..interceptors.add(AuthInterceptor(tokenStore, bareDio))
    ..interceptors.add(_ApiLogInterceptor());

  if (userAgentBuilder != null) {
    final uaInterceptor = _UserAgentInterceptor(userAgentBuilder);
    dio.interceptors.add(uaInterceptor);
    bareDio.interceptors.add(uaInterceptor);
  }

  return dio;
}
