// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TermsDto _$TermsDtoFromJson(Map<String, dynamic> json) => _TermsDto(
  id: (json['id'] as num).toInt(),
  type: json['type'] as String,
  version: json['version'] as String,
  title: json['title'] as String,
  contentUrl: json['contentUrl'] as String,
  effectiveAt: json['effectiveAt'] as String,
);

Map<String, dynamic> _$TermsDtoToJson(_TermsDto instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'version': instance.version,
  'title': instance.title,
  'contentUrl': instance.contentUrl,
  'effectiveAt': instance.effectiveAt,
};
