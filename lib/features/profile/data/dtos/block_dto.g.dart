// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BlockDto _$BlockDtoFromJson(Map<String, dynamic> json) => _BlockDto(
  blockedShareCode: json['blockedShareCode'] as String,
  blockedAt: DateTime.parse(json['blockedAt'] as String),
);

Map<String, dynamic> _$BlockDtoToJson(_BlockDto instance) => <String, dynamic>{
  'blockedShareCode': instance.blockedShareCode,
  'blockedAt': instance.blockedAt.toIso8601String(),
};
