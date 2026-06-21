// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_guardian_consent_approve_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractGuardianConsentApproveDto _$ContractGuardianConsentApproveDtoFromJson(
  Map<String, dynamic> json,
) => _ContractGuardianConsentApproveDto(
  publicCode: json['publicCode'] as String,
  guardianConsentAt: DateTime.parse(json['guardianConsentAt'] as String),
);

Map<String, dynamic> _$ContractGuardianConsentApproveDtoToJson(
  _ContractGuardianConsentApproveDto instance,
) => <String, dynamic>{
  'publicCode': instance.publicCode,
  'guardianConsentAt': instance.guardianConsentAt.toIso8601String(),
};
