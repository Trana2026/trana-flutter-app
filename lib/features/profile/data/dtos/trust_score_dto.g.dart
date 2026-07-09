// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trust_score_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrustScoreDto _$TrustScoreDtoFromJson(Map<String, dynamic> json) =>
    _TrustScoreDto(
      trustScore: (json['trustScore'] as num).toInt(),
      trustGrade: json['trustGrade'] as String,
      trustGradeLabel: json['trustGradeLabel'] as String,
      completedContractCount: (json['completedContractCount'] as num).toInt(),
      warrantyProvidedCount: (json['warrantyProvidedCount'] as num).toInt(),
      fraudReportReceivedCount: (json['fraudReportReceivedCount'] as num)
          .toInt(),
    );

Map<String, dynamic> _$TrustScoreDtoToJson(_TrustScoreDto instance) =>
    <String, dynamic>{
      'trustScore': instance.trustScore,
      'trustGrade': instance.trustGrade,
      'trustGradeLabel': instance.trustGradeLabel,
      'completedContractCount': instance.completedContractCount,
      'warrantyProvidedCount': instance.warrantyProvidedCount,
      'fraudReportReceivedCount': instance.fraudReportReceivedCount,
    };
