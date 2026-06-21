import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/guardian/domain/entities/user_me_entity.dart';

part 'user_me_dto.freezed.dart';
part 'user_me_dto.g.dart';

/// GET /v1/users/me 응답 DTO
@freezed
abstract class UserMeDto with _$UserMeDto {
  const factory UserMeDto({
    required String publicCode,
    String? email,
    String? nickname,
    required String status,
    String? ageGroup,
    String? guardianVerifiedAt,
  }) = _UserMeDto;

  factory UserMeDto.fromJson(Map<String, dynamic> json) =>
      _$UserMeDtoFromJson(json);
}

extension UserMeDtoMapper on UserMeDto {
  /// DTO → Domain Entity 변환 매퍼
  UserMeEntity toEntity() => UserMeEntity(
    publicCode: publicCode,
    email: email,
    nickname: nickname,
    status: status,
    ageGroup: ageGroup,
    guardianVerifiedAt: guardianVerifiedAt != null
        ? DateTime.parse(guardianVerifiedAt!)
        : null,
  );
}
