// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_minor_disclosure_confirm_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractMinorDisclosureConfirmDto _$ContractMinorDisclosureConfirmDtoFromJson(
  Map<String, dynamic> json,
) => _ContractMinorDisclosureConfirmDto(
  confirmedAt: DateTime.parse(json['confirmedAt'] as String),
  templateVersion: json['templateVersion'] as String,
);

Map<String, dynamic> _$ContractMinorDisclosureConfirmDtoToJson(
  _ContractMinorDisclosureConfirmDto instance,
) => <String, dynamic>{
  'confirmedAt': instance.confirmedAt.toIso8601String(),
  'templateVersion': instance.templateVersion,
};
