import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_dto.freezed.dart';
part 'user_info_dto.g.dart';

@freezed
abstract class UserInfoDto with _$UserInfoDto {
  const factory UserInfoDto({
    required String publicCode,
    String? email,
    required String status,
    required String ageGroup,
    DateTime? guardianVerifiedAt,
    String? name,
    String? birthDate,
    String? gender,
    String? phone,
    required bool pushEnabled,
  }) = _UserInfoDto;

  factory UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);
}
