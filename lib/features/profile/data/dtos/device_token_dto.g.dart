// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceTokenDto _$DeviceTokenDtoFromJson(Map<String, dynamic> json) =>
    _DeviceTokenDto(
      id: (json['id'] as num).toInt(),
      platform: json['platform'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastUsedAt: json['lastUsedAt'] == null
          ? null
          : DateTime.parse(json['lastUsedAt'] as String),
    );

Map<String, dynamic> _$DeviceTokenDtoToJson(_DeviceTokenDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'platform': instance.platform,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastUsedAt': instance.lastUsedAt?.toIso8601String(),
    };
