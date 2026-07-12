import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_me_entity.freezed.dart';

/// 현재 사용자 정보 (GET /v1/users/me 응답)
@freezed
abstract class UserMeEntity with _$UserMeEntity {
  const factory UserMeEntity({
    required String publicCode,
    String? email,
    String? name, // 실명 (PASS 인증 유저)
    String? phone, // 휴대폰 번호 (PASS 인증 유저)
    required String status, // ACTIVE | WITHDRAWN
    String? ageGroup, // ADULT | MINOR | null(미완료)
    DateTime? guardianVerifiedAt, // null일경우 미완료
  }) = _UserMeEntity;
}
