// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_draft_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractDraftDto _$ContractDraftDtoFromJson(Map<String, dynamic> json) =>
    _ContractDraftDto(
      publicCode: json['publicCode'] as String,
      status: json['status'] as String,
      disputeState: json['disputeState'] as String,
      deliveryType: json['deliveryType'] as String?,
      consentType: json['consentType'] as String?,
      tradingPlatform: json['tradingPlatform'] as String?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      conditionSummary: json['conditionSummary'] as String?,
      conditionDetails: json['conditionDetails'] as String?,
      warrantyPeriodDays: (json['warrantyPeriodDays'] as num).toInt(),
      guardianConsentAt: json['guardianConsentAt'] == null
          ? null
          : DateTime.parse(json['guardianConsentAt'] as String),
      version: (json['version'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      riskSignals: json['riskSignals'] == null
          ? null
          : ContractRiskSignalsDto.fromJson(
              json['riskSignals'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ContractDraftDtoToJson(_ContractDraftDto instance) =>
    <String, dynamic>{
      'publicCode': instance.publicCode,
      'status': instance.status,
      'disputeState': instance.disputeState,
      'deliveryType': instance.deliveryType,
      'consentType': instance.consentType,
      'tradingPlatform': instance.tradingPlatform,
      'title': instance.title,
      'price': instance.price,
      'conditionSummary': instance.conditionSummary,
      'conditionDetails': instance.conditionDetails,
      'warrantyPeriodDays': instance.warrantyPeriodDays,
      'guardianConsentAt': instance.guardianConsentAt?.toIso8601String(),
      'version': instance.version,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'riskSignals': instance.riskSignals,
    };

_ContractRiskSignalsDto _$ContractRiskSignalsDtoFromJson(
  Map<String, dynamic> json,
) => _ContractRiskSignalsDto(
  hasReportHistory: json['hasReportHistory'] as bool? ?? false,
  trustScoreZero: json['trustScoreZero'] as bool? ?? false,
  counterpartyTrustScore: (json['counterpartyTrustScore'] as num?)?.toInt(),
  counterpartyTrustGrade: json['counterpartyTrustGrade'] as String?,
  counterpartyIsMinor: json['counterpartyIsMinor'] as bool? ?? false,
  counterpartyVerified: json['counterpartyVerified'] as bool? ?? false,
  counterpartyTradeCount:
      (json['counterpartyTradeCount'] as num?)?.toInt() ?? 0,
  counterpartyDisputeCount:
      (json['counterpartyDisputeCount'] as num?)?.toInt() ?? 0,
  counterpartyConfirmedReportCount:
      (json['counterpartyConfirmedReportCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ContractRiskSignalsDtoToJson(
  _ContractRiskSignalsDto instance,
) => <String, dynamic>{
  'hasReportHistory': instance.hasReportHistory,
  'trustScoreZero': instance.trustScoreZero,
  'counterpartyTrustScore': instance.counterpartyTrustScore,
  'counterpartyTrustGrade': instance.counterpartyTrustGrade,
  'counterpartyIsMinor': instance.counterpartyIsMinor,
  'counterpartyVerified': instance.counterpartyVerified,
  'counterpartyTradeCount': instance.counterpartyTradeCount,
  'counterpartyDisputeCount': instance.counterpartyDisputeCount,
  'counterpartyConfirmedReportCount': instance.counterpartyConfirmedReportCount,
};
