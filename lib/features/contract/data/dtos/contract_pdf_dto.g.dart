// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_pdf_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractPdfDto _$ContractPdfDtoFromJson(Map<String, dynamic> json) =>
    _ContractPdfDto(
      downloadUrl: json['downloadUrl'] as String,
      expiresInSeconds: (json['expiresInSeconds'] as num).toInt(),
      sha256: json['sha256'] as String,
    );

Map<String, dynamic> _$ContractPdfDtoToJson(_ContractPdfDto instance) =>
    <String, dynamic>{
      'downloadUrl': instance.downloadUrl,
      'expiresInSeconds': instance.expiresInSeconds,
      'sha256': instance.sha256,
    };
