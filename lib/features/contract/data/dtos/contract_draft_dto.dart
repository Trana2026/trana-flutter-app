import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_draft_dto.freezed.dart';
part 'contract_draft_dto.g.dart';

@freezed
abstract class ContractDraftDto with _$ContractDraftDto {
  const factory ContractDraftDto({
    required String publicCode,
    required String status,
    required String disputeState,
    String? deliveryType,
    String? consentType,
    String? tradingPlatform,
    String? title,
    int? price,
    String? conditionSummary,
    String? conditionDetails,
    required int warrantyPeriodDays,
    DateTime? guardianConsentAt,
    required int version,
    required DateTime createdAt,
    required DateTime updatedAt,
    ContractRiskSignalsDto? riskSignals,
  }) = _ContractDraftDto;

  factory ContractDraftDto.fromJson(Map<String, dynamic> json) =>
      _$ContractDraftDtoFromJson(json);
}

@freezed
abstract class ContractRiskSignalsDto with _$ContractRiskSignalsDto {
  const factory ContractRiskSignalsDto({
    @Default(false) bool guardianNotConsented,
    @Default(false) bool hasReportHistory,
    @Default(false) bool trustScoreZero,
    int? counterpartyTrustScore,
    String? counterpartyTrustGrade,
  }) = _ContractRiskSignalsDto;

  factory ContractRiskSignalsDto.fromJson(Map<String, dynamic> json) =>
      _$ContractRiskSignalsDtoFromJson(json);
}
