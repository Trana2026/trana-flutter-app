// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BlockedUserDto _$BlockedUserDtoFromJson(Map<String, dynamic> json) =>
    _BlockedUserDto(
      shareCode: json['shareCode'] as String,
      blockedAt: DateTime.parse(json['blockedAt'] as String),
    );

Map<String, dynamic> _$BlockedUserDtoToJson(_BlockedUserDto instance) =>
    <String, dynamic>{
      'shareCode': instance.shareCode,
      'blockedAt': instance.blockedAt.toIso8601String(),
    };
