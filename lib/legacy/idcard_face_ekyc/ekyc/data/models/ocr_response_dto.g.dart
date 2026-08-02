// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OcrResponseDto _$OcrResponseDtoFromJson(Map<String, dynamic> json) =>
    _OcrResponseDto(
      requestId: json['requestId'] as String,
      idType: json['idType'] as String,
      name: json['name'] as String,
      birthDate: json['birthDate'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$OcrResponseDtoToJson(_OcrResponseDto instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'idType': instance.idType,
      'name': instance.name,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
    };
