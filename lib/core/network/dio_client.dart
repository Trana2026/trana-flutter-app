import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trana/core/network/auth_interceptor.dart';
import 'package:trana/core/network/auth_token_store.dart';

const _baseUrl = 'https://trana-api-server-production.up.railway.app';

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
      debugPrint('🌈 [$name 성공] ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      final req = err.requestOptions;
      final name = _apiName(req.method, req.path);
      debugPrint('🌈 [$name 실패] ${err.response?.data ?? err.message}');
    }
    super.onError(err, handler);
  }
}

/// Dio 인스턴스 생성.
/// base URL, timeout, 인증 인터셉터 적용
Dio createDio(AuthTokenStore tokenStore) {
  final options = BaseOptions(
    baseUrl: _baseUrl,
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

  return dio;
}
