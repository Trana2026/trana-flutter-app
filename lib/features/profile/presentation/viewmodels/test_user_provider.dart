import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/contract/data/services/pending_invitation_token_service.dart';
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
  static const adult = 'TST-ADL-A01'; // 성인
  static const minor = 'TST-MIN-C01'; // 미성년자
  final invitationToken = "5FQwytQvJQ1gV6Uz7OhLA"; // 테스트용 초대 토큰 붙여넣기

  @override
  TestUserEntity? build() => null;

  Future<void> getUser() async {
    // 사용 안할 때
    return;

    // 테스트 유저1 : 성인 + 요청자
    // await login(adult);

    // 테스트 유저2 : 미성년자 + 수신자
    // await login(minor);
    // await saveToken();
  }

  Future<void> login(String userPublicCode) async {
    final dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL'] ?? ''));
    try {
      /// JWT 발급
      final tokenResponse = await dio.get<Map<String, dynamic>>(
        '/v1/dev/token',
        queryParameters: {'publicCode': userPublicCode},
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

      final tokenStore = ref.read(authTokenStoreProvider);
      tokenStore.accessToken = accessToken;
      tokenStore.refreshToken = refreshToken;
    } on DioException catch (e) {
      debugPrint(
        '[TestUser] login failed: ${e.requestOptions.method} ${e.requestOptions.path} '
        '${e.response?.statusCode} ${e.response?.data}',
      );
      rethrow;
    }
  }

  Future<void> saveToken() async {
    final existing = await PendingInvitationTokenService.get();
    if (existing != null) return;
    await PendingInvitationTokenService.save(invitationToken);
  }
}
