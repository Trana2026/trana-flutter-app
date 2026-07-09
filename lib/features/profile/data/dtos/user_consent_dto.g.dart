// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_consent_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserConsentDto _$UserConsentDtoFromJson(Map<String, dynamic> json) =>
    _UserConsentDto(
      termsId: (json['termsId'] as num).toInt(),
      type: json['type'] as String,
      version: json['version'] as String,
      title: json['title'] as String,
      agreedAt: DateTime.parse(json['agreedAt'] as String),
    );

Map<String, dynamic> _$UserConsentDtoToJson(_UserConsentDto instance) =>
    <String, dynamic>{
      'termsId': instance.termsId,
      'type': instance.type,
      'version': instance.version,
      'title': instance.title,
      'agreedAt': instance.agreedAt.toIso8601String(),
    };
