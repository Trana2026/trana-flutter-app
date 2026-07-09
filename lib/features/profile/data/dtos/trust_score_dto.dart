import 'package:freezed_annotation/freezed_annotation.dart';

part 'trust_score_dto.freezed.dart';
part 'trust_score_dto.g.dart';

@freezed
abstract class TrustScoreDto with _$TrustScoreDto {
  const factory TrustScoreDto({
    required int trustScore,
    required String trustGrade,
    required String trustGradeLabel,
    required int completedContractCount,
    required int warrantyProvidedCount,
    required int fraudReportReceivedCount,
  }) = _TrustScoreDto;

  factory TrustScoreDto.fromJson(Map<String, dynamic> json) =>
      _$TrustScoreDtoFromJson(json);
}
