// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_me_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserMeDto _$UserMeDtoFromJson(Map<String, dynamic> json) => _UserMeDto(
  publicCode: json['publicCode'] as String,
  email: json['email'] as String?,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  status: json['status'] as String,
  ageGroup: json['ageGroup'] as String?,
  guardianVerifiedAt: json['guardianVerifiedAt'] as String?,
);

Map<String, dynamic> _$UserMeDtoToJson(_UserMeDto instance) =>
    <String, dynamic>{
      'publicCode': instance.publicCode,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'status': instance.status,
      'ageGroup': instance.ageGroup,
      'guardianVerifiedAt': instance.guardianVerifiedAt,
    };
