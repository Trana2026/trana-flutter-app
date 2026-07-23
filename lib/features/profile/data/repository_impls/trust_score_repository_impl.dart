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
  Future<Result<TrustScoreEntity>> readTrustScore() {
    return guardResult(
      () async {
        final dto = await dataSource.getTrustScore();
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        401 => const UnauthorizedFailure('잘못된 토큰입니다.'),
        404 => const NotFoundFailure('사용자를 찾을 수 없습니다.'),
        _ => null,
      },
    );
  }
}
