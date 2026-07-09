import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/profile/domain/enums/trust_grade.dart';

part 'trust_score_entity.freezed.dart';

@freezed
abstract class TrustScoreEntity with _$TrustScoreEntity {
  const factory TrustScoreEntity({
    required int trustScore,
    required TrustGrade trustGrade,
    required String trustGradeLabel,
    required int completedContractCount,
    required int warrantyProvidedCount,
    required int fraudReportReceivedCount,
  }) = _TrustScoreEntity;
}
