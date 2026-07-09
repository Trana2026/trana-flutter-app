import 'package:dio/dio.dart';
import 'package:trana/features/profile/data/dtos/user_consent_dto.dart';

class UserConsentDataSource {
  const UserConsentDataSource(this.dio);

  final Dio dio;

  /// GET 본인 약관 동의 내역 조회
  Future<List<UserConsentDto>> getConsents() async {
    final response = await dio.get<List<dynamic>>('/v1/users/me/consents');
    return (response.data ?? [])
        .map((e) => UserConsentDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
