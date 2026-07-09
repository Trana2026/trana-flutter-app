import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/entities/trust_score_entity.dart';

abstract interface class TrustScoreRepository {
  Future<Result<TrustScoreEntity>> readTrustScore();
}
