import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/data/datasources/user_consent_data_source.dart';
import 'package:trana/features/profile/data/mappers/user_consent_mapper.dart';
import 'package:trana/features/profile/domain/entities/user_consent_entity.dart';
import 'package:trana/features/profile/domain/repositories/user_consent_repository.dart';

class UserConsentRepositoryImpl implements UserConsentRepository {
  const UserConsentRepositoryImpl(this.dataSource);

  final UserConsentDataSource dataSource;

  @override
  Future<Result<List<UserConsentEntity>>> readConsents() async {
    try {
      final dtos = await dataSource.getConsents();
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
}
