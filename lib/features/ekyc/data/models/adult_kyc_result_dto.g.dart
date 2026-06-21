// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adult_kyc_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdultKycResultDto _$AdultKycResultDtoFromJson(Map<String, dynamic> json) =>
    _AdultKycResultDto(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      publicCode: json['publicCode'] as String,
      requiresGuardian: json['requiresGuardian'] as bool,
    );

Map<String, dynamic> _$AdultKycResultDtoToJson(_AdultKycResultDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'publicCode': instance.publicCode,
      'requiresGuardian': instance.requiresGuardian,
    };
