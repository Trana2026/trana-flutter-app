// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyResponseDto _$VerifyResponseDtoFromJson(Map<String, dynamic> json) =>
    _VerifyResponseDto(
      requestId: json['requestId'] as String,
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$VerifyResponseDtoToJson(_VerifyResponseDto instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'verified': instance.verified,
    };
