import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/profile/data/datasources/device_token_data_source.dart';
import 'package:trana/features/profile/data/mappers/device_token_mapper.dart';
import 'package:trana/features/profile/domain/entities/device_token_entity.dart';
import 'package:trana/features/profile/domain/enums/device_platform.dart';
import 'package:trana/features/profile/domain/repositories/device_token_repository.dart';

class DeviceTokenRepositoryImpl implements DeviceTokenRepository {
  const DeviceTokenRepositoryImpl(this.dataSource);

  final DeviceTokenDataSource dataSource;

  @override
  Future<Result<List<DeviceTokenEntity>>> readDevices() {
    return guardResult(
      () async {
        final dtos = await dataSource.getDevices();
        return dtos.map((dto) => dto.toEntity()).toList();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        401 => const UnauthorizedFailure('잘못된 토큰입니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<int>> createDeviceToken({
    required String token,
    required DevicePlatform platform,
    String? deviceModel,
    String? osVersion,
    String? appVersion,
  }) {
    return guardResult(
      () => dataSource.postDeviceToken(
        token: token,
        platform: platform.apiString,
        deviceModel: deviceModel,
        osVersion: osVersion,
        appVersion: appVersion,
      ),
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('입력값 검증에 실패했습니다.'),
        401 => const UnauthorizedFailure('잘못된 토큰입니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<void>> deleteDeviceToken(String token) {
    return guardResult(
      () => dataSource.deleteDeviceToken(token),
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('입력값 검증에 실패했습니다.'),
        401 => const UnauthorizedFailure('잘못된 토큰입니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<void>> ping(String token) {
    return guardResult(
      () => dataSource.ping(token),
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('토큰을 찾을 수 없습니다.'),
        401 => const UnauthorizedFailure('잘못된 토큰입니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<void>> disconnect(int id) {
    return guardResult(
      () => dataSource.disconnect(id),
      onDioException: (e) => switch (e.response?.statusCode) {
        401 => const UnauthorizedFailure('잘못된 토큰입니다.'),
        404 => const NotFoundFailure('기기를 찾을 수 없습니다.'),
        _ => null,
      },
    );
  }
}
