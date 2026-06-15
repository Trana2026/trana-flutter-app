// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_guardian_consent_link_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractGuardianConsentLinkDto _$ContractGuardianConsentLinkDtoFromJson(
  Map<String, dynamic> json,
) => _ContractGuardianConsentLinkDto(
  token: json['token'] as String,
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  verifyUrl: json['verifyUrl'] as String,
);

Map<String, dynamic> _$ContractGuardianConsentLinkDtoToJson(
  _ContractGuardianConsentLinkDto instance,
) => <String, dynamic>{
  'token': instance.token,
  'expiresAt': instance.expiresAt.toIso8601String(),
  'verifyUrl': instance.verifyUrl,
};
