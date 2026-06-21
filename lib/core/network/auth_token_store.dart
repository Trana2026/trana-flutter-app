import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// accessToken/refreshToken을 관리하는 토큰 저장소.
///
/// 인메모리캐시: 앱 실행 중 Dio 인터셉터가 토큰을 빠르게 읽기 위해 보관.
/// secure storage: 앱 재실행 후 토큰을 복원하는 refreshToken을 관리.
/// 앱 시작 시 load()로 secure storage의 토큰을 인메모리에 복원.
///
/// 토큰이 저장/삭제/갱신되면 notifyListeners()를 호출해서
/// GoRouter가 로그인 상태를 다시 판단하게 함
class AuthTokenStore extends ChangeNotifier {
  static const _kAccess = 'auth_access_token';
  static const _kRefresh = 'auth_refresh_token';

  final FlutterSecureStorage _storage;
  String? _accessToken;
  String? _refreshToken;

  AuthTokenStore(this._storage);

  /// 로그인 여부 (access 토큰 보유)
  bool get isLoggedIn => _accessToken != null && _accessToken!.isNotEmpty;

  String? get accessToken => _accessToken;

  set accessToken(String? value) {
    _accessToken = value;
    _write(_kAccess, value);
    notifyListeners();
  }

  String? get refreshToken => _refreshToken;

  set refreshToken(String? value) {
    _refreshToken = value;
    _write(_kRefresh, value);
  }

  /// 앱 시작 시 secure storage에서 토큰 복원
  Future<void> load() async {
    _accessToken = await _storage.read(key: _kAccess);
    _refreshToken = await _storage.read(key: _kRefresh);
    notifyListeners();
  }

  /// 토큰 전체 삭제 (로그아웃/탈퇴)
  Future<void> clear() async {
    _accessToken = null;
    _refreshToken = null;
    await _storage.delete(key: _kAccess);
    await _storage.delete(key: _kRefresh);
    notifyListeners();
  }

  /// 메모리 값에서 secure storage 비동기 반영 (null이면 삭제)
  void _write(String key, String? value) {
    if (value == null) {
      _storage.delete(key: key);
    } else {
      _storage.write(key: key, value: value);
    }
  }
}
