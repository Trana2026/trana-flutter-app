import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/entities/device_token_entity.dart';
import 'package:trana/features/profile/domain/enums/device_platform.dart';

abstract interface class DeviceTokenRepository {
  Future<Result<List<DeviceTokenEntity>>> readDevices();

  Future<Result<int>> createDeviceToken({
    required String token,
    required DevicePlatform platform,
    String? deviceModel,
    String? osVersion,
    String? appVersion,
  });

  Future<Result<void>> deleteDeviceToken(String token);

  Future<Result<void>> ping(String token);

  Future<Result<void>> disconnect(int id);
}
