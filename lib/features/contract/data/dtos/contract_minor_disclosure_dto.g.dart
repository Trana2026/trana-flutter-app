// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_minor_disclosure_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractMinorDisclosureDto _$ContractMinorDisclosureDtoFromJson(
  Map<String, dynamic> json,
) => _ContractMinorDisclosureDto(
  version: json['version'] as String,
  title: json['title'] as String,
  items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ContractMinorDisclosureDtoToJson(
  _ContractMinorDisclosureDto instance,
) => <String, dynamic>{
  'version': instance.version,
  'title': instance.title,
  'items': instance.items,
};
