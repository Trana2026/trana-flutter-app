// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pass_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PassResultDto _$PassResultDtoFromJson(Map<String, dynamic> json) =>
    _PassResultDto(
      purpose: json['purpose'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      publicCode: json['publicCode'] as String?,
      requiresGuardian: json['requiresGuardian'] as bool?,
      resultCode: json['resultCode'] as String?,
      statusCode: json['statusCode'] as String?,
      resultMsg: json['resultMsg'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$PassResultDtoToJson(_PassResultDto instance) =>
    <String, dynamic>{
      'purpose': instance.purpose,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'publicCode': instance.publicCode,
      'requiresGuardian': instance.requiresGuardian,
      'resultCode': instance.resultCode,
      'statusCode': instance.statusCode,
      'resultMsg': instance.resultMsg,
      'code': instance.code,
    };
