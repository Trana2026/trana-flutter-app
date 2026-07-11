import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/data/datasources/trust_score_data_source.dart';
import 'package:trana/features/profile/data/mappers/trust_score_mapper.dart';
import 'package:trana/features/profile/domain/entities/trust_score_entity.dart';
import 'package:trana/features/profile/domain/repositories/trust_score_repository.dart';

class TrustScoreRepositoryImpl implements TrustScoreRepository {
  const TrustScoreRepositoryImpl(this.dataSource);

  final TrustScoreDataSource dataSource;

  @override
  Future<Result<TrustScoreEntity>> readTrustScore() async {
    try {
      final dto = await dataSource.getTrustScore();
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
