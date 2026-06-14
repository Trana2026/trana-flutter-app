// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_attachment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractAttachmentDto _$ContractAttachmentDtoFromJson(
  Map<String, dynamic> json,
) => _ContractAttachmentDto(
  id: (json['id'] as num).toInt(),
  s3Key: json['s3Key'] as String,
  originalFilename: json['originalFilename'] as String,
  contentType: json['contentType'] as String,
  sizeBytes: (json['sizeBytes'] as num).toInt(),
  sha256: json['sha256'] as String,
  sortOrder: (json['sortOrder'] as num).toInt(),
  uploadedAt: DateTime.parse(json['uploadedAt'] as String),
  viewUrl: json['viewUrl'] as String?,
);

Map<String, dynamic> _$ContractAttachmentDtoToJson(
  _ContractAttachmentDto instance,
) => <String, dynamic>{
  'id': instance.id,
  's3Key': instance.s3Key,
  'originalFilename': instance.originalFilename,
  'contentType': instance.contentType,
  'sizeBytes': instance.sizeBytes,
  'sha256': instance.sha256,
  'sortOrder': instance.sortOrder,
  'uploadedAt': instance.uploadedAt.toIso8601String(),
  'viewUrl': instance.viewUrl,
};
