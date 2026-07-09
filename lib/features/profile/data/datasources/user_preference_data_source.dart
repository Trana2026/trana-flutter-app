import 'package:dio/dio.dart';
import 'package:trana/features/profile/data/dtos/user_preference_dto.dart';

class UserPreferenceDataSource {
  const UserPreferenceDataSource(this.dio);

  final Dio dio;

  /// POST 푸시 알림 토글
  Future<UserPreferenceDto> togglePushEnabled(bool enabled) async {
    final response = await dio.patch<Map<String, dynamic>>(
      '/v1/users/me/push-enabled',
      data: {'enabled': enabled},
    );
    return UserPreferenceDto.fromJson(response.data!);
  }
}
