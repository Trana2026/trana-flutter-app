import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// 보호자 인증 링크 token, expiresAt (secure storage).
/// 재진입 시 상태 복원용
class GuardianLinkStore {
  static const _kToken = 'guardian_link_token';
  static const _kExpiresAt = 'guardian_link_expires_at';

  final FlutterSecureStorage _storage;
  const GuardianLinkStore(this._storage);

  /// 발급된 링크 token/expiresAt 저장
  Future<void> save({
    required String token,
    required DateTime expiresAt,
  }) async {
    await _storage.write(key: _kToken, value: token);
    await _storage.write(key: _kExpiresAt, value: expiresAt.toIso8601String());
  }

  /// 저장된 token 조회
  Future<String?> readToken() => _storage.read(key: _kToken);

  /// 저장된 expiresAt 조회
  Future<DateTime?> readExpiresAt() async {
    final value = await _storage.read(key: _kExpiresAt);
    return value == null ? null : DateTime.tryParse(value);
  }

  /// 저장된 링크 정보 삭제
  Future<void> clear() async {
    await _storage.delete(key: _kToken);
    await _storage.delete(key: _kExpiresAt);
  }
}
