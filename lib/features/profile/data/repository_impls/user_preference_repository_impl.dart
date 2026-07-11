import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/data/datasources/user_preference_data_source.dart';
import 'package:trana/features/profile/data/mappers/user_preference_mapper.dart';
import 'package:trana/features/profile/domain/entities/user_preference_entity.dart';
import 'package:trana/features/profile/domain/repositories/user_preference_repository.dart';

class UserPreferenceRepositoryImpl implements UserPreferenceRepository {
  const UserPreferenceRepositoryImpl(this.dataSource);

  final UserPreferenceDataSource dataSource;

  @override
  Future<Result<UserPreferenceEntity>> togglePushEnabled(bool enabled) async {
    try {
      final dto = await dataSource.togglePushEnabled(enabled);
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
}
