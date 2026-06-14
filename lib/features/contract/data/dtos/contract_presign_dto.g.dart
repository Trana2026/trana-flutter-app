// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_presign_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractPresignDto _$ContractPresignDtoFromJson(Map<String, dynamic> json) =>
    _ContractPresignDto(
      uploadUrl: json['uploadUrl'] as String,
      s3Key: json['s3Key'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$ContractPresignDtoToJson(_ContractPresignDto instance) =>
    <String, dynamic>{
      'uploadUrl': instance.uploadUrl,
      's3Key': instance.s3Key,
      'expiresAt': instance.expiresAt.toIso8601String(),
    };
