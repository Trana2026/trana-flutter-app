// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guardian_link_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GuardianLinkDto _$GuardianLinkDtoFromJson(Map<String, dynamic> json) =>
    _GuardianLinkDto(
      token: json['token'] as String,
      expiresAt: json['expiresAt'] as String,
      verifyUrl: json['verifyUrl'] as String,
    );

Map<String, dynamic> _$GuardianLinkDtoToJson(_GuardianLinkDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresAt': instance.expiresAt,
      'verifyUrl': instance.verifyUrl,
    };
