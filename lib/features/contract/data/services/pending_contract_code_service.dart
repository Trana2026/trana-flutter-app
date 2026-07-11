import 'package:shared_preferences/shared_preferences.dart';

/// 딥링크 계약 코드 임시 저장 서비스
/// 딥링크로 수신한 계약코드를 홈 화면에 진입할 때까지 보관
class PendingContractCodeService {
  static const _key = 'pending_contract_code';

  static Future<void> save(String publicCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, publicCode);
  }

  static Future<String?> get() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
