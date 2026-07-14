import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
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
  Future<Result<List<DeviceTokenEntity>>> readDevices() async {
    try {
      final dtos = await dataSource.getDevices();
      return Success(dtos.map((dto) => dto.toEntity()).toList());
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Failure(ForbiddenFailure('잘못된 토큰입니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<int>> createDeviceToken({
    required String token,
    required DevicePlatform platform,
    String? deviceModel,
    String? osVersion,
    String? appVersion,
  }) async {
    try {
      final result = await dataSource.postDeviceToken(
        token: token,
        platform: platform.apiString,
        deviceModel: deviceModel,
        osVersion: osVersion,
        appVersion: appVersion,
      );
      return Success(result);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return const Failure(ForbiddenFailure('입력값 검증에 실패했습니다.'));
      }
      if (e.response?.statusCode == 401) {
        return const Failure(ForbiddenFailure('잘못된 토큰입니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> deleteDeviceToken(String token) async {
    try {
      await dataSource.deleteDeviceToken(token);
      return Success(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return const Failure(ForbiddenFailure('입력값 검증에 실패했습니다.'));
      }
      if (e.response?.statusCode == 401) {
        return const Failure(ForbiddenFailure('잘못된 토큰입니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> ping(String token) async {
    try {
      await dataSource.ping(token);
      return Success(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return const Failure(ForbiddenFailure('토큰을 찾을 수 없습니다.'));
      }
      if (e.response?.statusCode == 401) {
        return const Failure(ForbiddenFailure('잘못된 토큰입니다.'));
      }

      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> disconnect(int id) async {
    try {
      await dataSource.disconnect(id);
      return Success(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Failure(ForbiddenFailure('잘못된 토큰입니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(ForbiddenFailure('기기를 찾을 수 없습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
