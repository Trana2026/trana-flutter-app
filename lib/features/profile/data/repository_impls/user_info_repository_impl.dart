import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/data/datasources/user_info_data_source.dart';
import 'package:trana/features/profile/data/mappers/user_info_mapper.dart';
import 'package:trana/features/profile/domain/entities/user_info_entity.dart';
import 'package:trana/features/profile/domain/repositories/user_info_repository.dart';

class UserInfoRepositoryImpl implements UserInfoRepository {
  const UserInfoRepositoryImpl(this.dataSource);

  final UserInfoDataSource dataSource;

  @override
  Future<Result<UserInfoEntity>> readUser() async {
    try {
      final dto = await dataSource.getMe();
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Failure(ForbiddenFailure('잘못된 토큰입니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(ForbiddenFailure('사용자를 찾을 수 없습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> withdraw() async {
    try {
      await dataSource.deleteMe();
      return Success(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Failure(ForbiddenFailure('잘못된 토큰입니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(ForbiddenFailure('사용자를 찾을 수 없습니다.'));
      }
      if (e.response?.statusCode == 409) {
        return const Failure(ForbiddenFailure('이미 탈퇴한 사용자입니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
