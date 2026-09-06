import 'package:flutter_dotenv/flutter_dotenv.dart';

/// 환경(.env) 종속 설정값 (base URL 등)
/// 존재하지 않을 시 fallback
///
/// dev/prod 전환은 .env의 값만 바꾸면 됨
class AppConfig {
  AppConfig._();

  /// API 서버 base URL
  static String get apiBaseUrl =>
      dotenv.env['BASE_URL'] ?? 'https://api.trana.kr';

  /// PASS 본인인증 웹 base URL
  static String get kycWebBaseUrl =>
      dotenv.env['KYC_WEB_URL'] ?? 'https://kyc.trana.kr';
}
