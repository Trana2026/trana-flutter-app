// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TermsContentDto _$TermsContentDtoFromJson(Map<String, dynamic> json) =>
    _TermsContentDto(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      version: json['version'] as String,
      title: json['title'] as String,
      contentHash: json['contentHash'] as String,
      content: json['content'] as String,
      effectiveAt: json['effectiveAt'] as String,
    );

Map<String, dynamic> _$TermsContentDtoToJson(_TermsContentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'version': instance.version,
      'title': instance.title,
      'contentHash': instance.contentHash,
      'content': instance.content,
      'effectiveAt': instance.effectiveAt,
    };
