// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractDto _$ContractDtoFromJson(Map<String, dynamic> json) => _ContractDto(
  publicCode: json['publicCode'] as String,
  status: json['status'] as String,
  title: json['title'] as String?,
  price: (json['price'] as num?)?.toInt(),
  myRole: json['myRole'] as String?,
  attachmentCount: (json['attachmentCount'] as num).toInt(),
  firstAttachmentUrl: json['firstAttachmentUrl'] as String?,
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ContractDtoToJson(_ContractDto instance) =>
    <String, dynamic>{
      'publicCode': instance.publicCode,
      'status': instance.status,
      'title': instance.title,
      'price': instance.price,
      'myRole': instance.myRole,
      'attachmentCount': instance.attachmentCount,
      'firstAttachmentUrl': instance.firstAttachmentUrl,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
