import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/events/base_event.dart';
import 'package:amplitude_flutter/events/identify.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// GA4(Firebase Analytics) + Amplitude 공통 트래킹 wrapper
class AnalyticsService {
  AnalyticsService._();

  static Amplitude? _amplitude;
  static FirebaseAnalytics? _firebaseAnalytics;

  /// main()에서 1회 호출
  static Future<void> init() async {
    _firebaseAnalytics = FirebaseAnalytics.instance;

    final apiKey = dotenv.env['AMPLITUDE_API_KEY'] ?? '';
    if (apiKey.isEmpty) return;

    final amplitude = Amplitude(Configuration(apiKey: apiKey));
    await amplitude.isBuilt;
    _amplitude = amplitude;
  }

  /// 이벤트 하나를 Amplitude + GA4에 동시 전송
  /// [ga4EventName]은 GA4 권장 이벤트명이 내부 이벤트명과 다를 때만 지정
  /// [ga4]를 false로 지정하면 GA4로는 전송하지 않고 Amplitude로만 전송
  /// (트래킹 플랜의 Destination=Amplitude 단독 이벤트에 사용)
  /// [eventId]는 클라이언트·서버 중복 이벤트 제거용 키로,
  /// Amplitude에는 insertId로, GA4에는 event_id 파라미터로 전달
  static Future<void> track(
    String eventName, {
    Map<String, Object?> properties = const {},
    String? ga4EventName,
    bool ga4 = true,
    String? eventId,
  }) async {
    final amplitude = _amplitude;
    final firebaseAnalytics = ga4 ? _firebaseAnalytics : null;

    await Future.wait([
      if (amplitude != null)
        amplitude.track(
          BaseEvent(eventName, eventProperties: properties, insertId: eventId),
        ),
      if (firebaseAnalytics != null)
        firebaseAnalytics.logEvent(
          name: ga4EventName ?? eventName,
          parameters: _sanitizeForGa4({...properties, 'event_id': ?eventId}),
        ),
    ]);
  }

  /// screen_view 이벤트 전송. 라우트 전환(EVT-001)과 바텀시트/다이얼로그 형태의
  /// 모달(Notes: "모달은 modal_viewed로 분리하거나 screen_name을 명시")에 공용으로 사용
  static Future<void> trackScreenView(String screenName, {String? entryPoint}) {
    return track(
      'screen_view',
      properties: {'screen_name': screenName, 'entry_point': ?entryPoint},
    );
  }

  /// 사용자 식별자를 Amplitude + GA4에 동시 설정
  static Future<void> setUserId(String? userId) async {
    final amplitude = _amplitude;
    final firebaseAnalytics = _firebaseAnalytics;

    await Future.wait([
      if (amplitude != null) amplitude.setUserId(userId),
      if (firebaseAnalytics != null) firebaseAnalytics.setUserId(id: userId),
    ]);
  }

  /// 사용자 속성 업데이트 (Amplitude 전용, GA4 user property는 범위 밖)
  static Future<void> identify(Map<String, Object?> userProperties) async {
    final amplitude = _amplitude;
    if (amplitude == null) return;

    final identify = Identify();
    userProperties.forEach((key, value) => identify.set(key, value));
    await amplitude.identify(identify);
  }

  /// 로그아웃·계정 전환 시 사용자 식별 상태 초기화
  static Future<void> reset() async {
    final amplitude = _amplitude;
    final firebaseAnalytics = _firebaseAnalytics;

    await Future.wait([
      if (amplitude != null) amplitude.reset(),
      if (firebaseAnalytics != null) firebaseAnalytics.resetAnalyticsData(),
    ]);
  }

  /// GA4 이벤트 파라미터는 String/num만 허용하므로 null과 지원하지 않는 타입 제거
  static Map<String, Object> _sanitizeForGa4(Map<String, Object?> properties) {
    final sanitized = <String, Object>{};
    for (final entry in properties.entries) {
      final value = entry.value;
      if (value is String) {
        sanitized[entry.key] = value;
      } else if (value is num) {
        sanitized[entry.key] = value;
      } else if (value is bool) {
        sanitized[entry.key] = value.toString();
      }
    }
    return sanitized;
  }
}
