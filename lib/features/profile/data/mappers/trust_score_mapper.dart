import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/profile/data/dtos/trust_score_dto.dart';
import 'package:trana/features/profile/domain/entities/trust_score_entity.dart';
import 'package:trana/features/profile/domain/enums/trust_grade.dart';

extension TrustScoreMapper on TrustScoreDto {
  TrustScoreEntity toEntity() {
    return TrustScoreEntity(
      trustScore: trustScore,
      trustGrade: TrustGrade.values.fromApiString(trustGrade),
      trustGradeLabel: trustGradeLabel,
      completedContractCount: completedContractCount,
      warrantyProvidedCount: warrantyProvidedCount,
      fraudReportReceivedCount: fraudReportReceivedCount,
    );
  }
}
