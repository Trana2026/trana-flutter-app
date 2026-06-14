// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_signed_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractSignedDto _$ContractSignedDtoFromJson(Map<String, dynamic> json) =>
    _ContractSignedDto(
      publicCode: json['publicCode'] as String,
      status: json['status'] as String,
      pdfVersion: (json['pdfVersion'] as num).toInt(),
      creatorSignedAt: DateTime.parse(json['creatorSignedAt'] as String),
    );

Map<String, dynamic> _$ContractSignedDtoToJson(_ContractSignedDto instance) =>
    <String, dynamic>{
      'publicCode': instance.publicCode,
      'status': instance.status,
      'pdfVersion': instance.pdfVersion,
      'creatorSignedAt': instance.creatorSignedAt.toIso8601String(),
    };
