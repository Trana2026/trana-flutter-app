import 'package:shared_preferences/shared_preferences.dart';

class OneTimeFlag {
  /// 미성년자 법정대리인 인증 완료 확인 (홈 화면에 인증 배너 표시 여부 결정)
  static const guardian = 'guardian_verified';
}

/// 최초 1회만 시행하는 작업의 완료 여부를 저장하는 서비스
/// 모든 키는 publicCode로 스코프되어, 탈퇴 후 재가입 시 새 계정에서는 리셋
class OneTimeFlagService {
  static String _key(String property, String publicCode) =>
      '${property}_$publicCode';

  /// 플래그 설정 여부 확인
  static Future<bool> check(String property, String publicCode) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key(property, publicCode)) ?? false;
  }

  /// 플래그 설정
  static Future<void> mark(String property, String publicCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key(property, publicCode), true);
  }

  /// 탈퇴 시 해당 계정의 모든 플래그 삭제
  static Future<void> clearForUser(String publicCode) async {
    final prefs = await SharedPreferences.getInstance();
    final suffix = '_$publicCode';
    final keys = prefs.getKeys().where((k) => k.endsWith(suffix));
    for (final key in keys) {
      await prefs.remove(key);
    }
  }
}
