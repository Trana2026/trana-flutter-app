import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FcmService {
  /// FCM 토큰 조회
  static Future<String> getFcmToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      return token ?? "";
    } catch (e) {
      // 토큰 조회 실패 무시 (앱 실행 차단 방지)
      debugPrint('[FcmService] getToken failed: $e');
      return "";
    }
  }
}
