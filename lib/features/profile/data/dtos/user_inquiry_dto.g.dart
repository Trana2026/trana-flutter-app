// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_inquiry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInquiryDto _$UserInquiryDtoFromJson(Map<String, dynamic> json) =>
    _UserInquiryDto(
      publicCode: json['publicCode'] as String,
      email: json['email'] as String?,
      title: json['title'] as String,
      content: json['content'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserInquiryDtoToJson(_UserInquiryDto instance) =>
    <String, dynamic>{
      'publicCode': instance.publicCode,
      'email': instance.email,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
    };
