import 'package:dio/dio.dart';
import 'package:trana/features/profile/data/dtos/device_token_dto.dart';

class DeviceTokenDataSource {
  const DeviceTokenDataSource(this.dio);

  final Dio dio;

  /// GET 내 기기 목록 조회
  Future<List<DeviceTokenDto>> getDevices() async {
    final response = await dio.get<List<dynamic>>('/v1/users/me/device-tokens');
    return (response.data ?? [])
        .map((e) => DeviceTokenDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST FCM 디바이스 토큰 등록
  Future<int> postDeviceToken({
    required String token,
    required String platform,
    String? deviceModel,
    String? osVersion,
    String? appVersion,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/users/me/device-tokens',
      data: {
        'token': token,
        'platform': platform,
        'deviceModel': deviceModel,
        'osVersion': osVersion,
        'appVersion': appVersion,
      },
    );
    return response.data!['id'] as int;
  }

  /// DELETE FCM 디바이스 토큰 해제
  Future<void> deleteDeviceToken(String token) async {
    await dio.delete<void>(
      '/v1/users/me/device-tokens',
      data: {'token': token},
    );
  }

  /// POST 기기 활성 ping
  Future<void> ping(String token) async {
    await dio.post<void>(
      '/v1/users/me/device-tokens/ping',
      data: {'token': token},
    );
  }

  /// DELETE 기기 강제 해제 (특정 단말)
  Future<void> disconnect(int id) async {
    await dio.delete<void>('/v1/users/me/device-tokens/$id');
  }
}
