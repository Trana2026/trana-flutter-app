import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/utils/enum_extension.dart';
import 'package:trana/features/contract/domain/enums/age_group.dart';

part 'test_user_provider.freezed.dart';
part 'test_user_provider.g.dart';

@freezed
abstract class TestUserEntity with _$TestUserEntity {
  const factory TestUserEntity({
    required String publicCode,
    required String email,
    required String nickname,
    required String status,
    AgeGroup? ageGroup,
    DateTime? guardianVerifiedAt,
    required String accessToken,
    required String refreshToken,
  }) = _TestUserEntity;
}

// ===================================================

@Riverpod(keepAlive: true)
class TestUser extends _$TestUser {
  static const _userPublicCode = 'TST-ADL-A01'; // 성인1
  // static const _userPublicCode = 'TST-ADL-B01'; // 성인2
  // static const _userPublicCode = 'TST-MIN-C01'; // 미성년자1
  // static const _userPublicCode = 'TST-MIN-D01'; // 미성년자2

  @override
  TestUserEntity? build() {
    return null;
  }

  Future<void> login() async {
    final dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL'] ?? ''));

    /// JWT 발급
    final tokenResponse = await dio.get<Map<String, dynamic>>(
      '/v1/dev/token',
      queryParameters: {'publicCode': _userPublicCode},
      options: Options(
        headers: {'X-Dev-Token-Key': '3zRq0BfaazhP7aGqjZgU0UGp5OeoA4HJ'},
      ),
    );

    final tokenData = tokenResponse.data!;
    final accessToken = (tokenData['accessToken'] as String?) ?? '';
    final refreshToken = (tokenData['refreshToken'] as String?) ?? '';

    /// 본인 정보 조회
    final meResponse = await dio.get<Map<String, dynamic>>(
      '/v1/users/me',
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );

    final me = meResponse.data!;

    state = TestUserEntity(
      publicCode: (me['publicCode'] as String?) ?? '',
      email: (me['email'] as String?) ?? '',
      nickname: (me['nickname'] as String?) ?? '',
      status: (me['status'] as String?) ?? '',
      ageGroup: me['ageGroup'] != null
          ? AgeGroup.values.fromApiString(me['ageGroup'] as String)
          : null,
      guardianVerifiedAt: me['guardianVerifiedAt'] == null
          ? null
          : DateTime.parse(me['guardianVerifiedAt'] as String),
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  Future<void> logout() async {
    state = null;
  }
}
