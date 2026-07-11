import 'package:dio/dio.dart';
import 'package:trana/features/profile/data/dtos/trust_score_dto.dart';

class TrustScoreDataSource {
  const TrustScoreDataSource(this.dio);

  final Dio dio;

  /// GET 신뢰 점수 카드 조회
  Future<TrustScoreDto> getTrustScore() async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v1/users/me/trust-score',
    );
    return TrustScoreDto.fromJson(response.data!);
  }
}
