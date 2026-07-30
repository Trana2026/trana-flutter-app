import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/user/domain/entities/user_me_entity.dart';

part 'user_me_dto.freezed.dart';
part 'user_me_dto.g.dart';

/// GET /v1/users/me 응답 DTO
@freezed
abstract class UserMeDto with _$UserMeDto {
  const factory UserMeDto({
    required String publicCode,
    String? email,
    String? name,
    String? phone,
    required String status,
    String? ageGroup,
    String? guardianVerifiedAt,
    required String shareCode,
  }) = _UserMeDto;

  factory UserMeDto.fromJson(Map<String, dynamic> json) =>
      _$UserMeDtoFromJson(json);
}

extension UserMeDtoMapper on UserMeDto {
  /// DTO → Domain Entity 변환 매퍼
  UserMeEntity toEntity() => UserMeEntity(
    publicCode: publicCode,
    email: email,
    name: name,
    phone: phone,
    status: status,
    ageGroup: ageGroup,
    guardianVerifiedAt: guardianVerifiedAt != null
        ? DateTime.parse(guardianVerifiedAt!)
        : null,
    shareCode: shareCode,
  );
}
