// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfoDto _$UserInfoDtoFromJson(Map<String, dynamic> json) => _UserInfoDto(
  publicCode: json['publicCode'] as String,
  email: json['email'] as String?,
  status: json['status'] as String,
  ageGroup: json['ageGroup'] as String,
  guardianVerifiedAt: json['guardianVerifiedAt'] == null
      ? null
      : DateTime.parse(json['guardianVerifiedAt'] as String),
  name: json['name'] as String?,
  birthDate: json['birthDate'] as String?,
  gender: json['gender'] as String?,
  phone: json['phone'] as String?,
  pushEnabled: json['pushEnabled'] as bool,
);

Map<String, dynamic> _$UserInfoDtoToJson(_UserInfoDto instance) =>
    <String, dynamic>{
      'publicCode': instance.publicCode,
      'email': instance.email,
      'status': instance.status,
      'ageGroup': instance.ageGroup,
      'guardianVerifiedAt': instance.guardianVerifiedAt?.toIso8601String(),
      'name': instance.name,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'phone': instance.phone,
      'pushEnabled': instance.pushEnabled,
    };
