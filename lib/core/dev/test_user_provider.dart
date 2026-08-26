import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/config/app_config.dart';
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
    required String name,
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
  @override
  TestUserEntity? build() => null;

  /// 성인 유저
  Future<void> getAdultUser() async {
    await login(
      'TST-ADL-A01',
      // 'TST-ADL-B01',
    );

    // 계약 초대 토큰 수신 (수신자 수동 테스트용)
    // await saveToken("sOgeQfiKRzblIiGOUOiup");
  }

  /// 미성년자 유저
  Future<void> getMinorUser() async {
    await login(
      'TST-MIN-C01',
      // 'TST-MIN-D01',
    );

    // 계약 초대 토큰 수신 (수신자 수동 테스트용)
    // await saveToken("qHquJEQtq25zh4HjPDPMz");
  }

  Future<void> login(String userPublicCode) async {
    final dio = Dio(BaseOptions(baseUrl: AppConfig.devApiBaseUrl));
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

      debugPrint('accessToken: $accessToken');

      /// 본인 정보 조회
      final meResponse = await dio.get<Map<String, dynamic>>(
        '/v1/users/me',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      final me = meResponse.data!;

      state = TestUserEntity(
        publicCode: (me['publicCode'] as String?) ?? '',
        email: (me['email'] as String?) ?? '',
        name: (me['name'] as String?) ?? '',
        status: (me['status'] as String?) ?? '',
        ageGroup: AgeGroup.values.tryFromApiString(me['ageGroup'] as String?),
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

  Future<void> saveToken(String invitationToken) async {
    final existing = await PendingInvitationTokenService.get();
    if (existing != null) return;
    await PendingInvitationTokenService.save(invitationToken);
  }
}
