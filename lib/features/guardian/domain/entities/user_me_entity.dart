import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_me_entity.freezed.dart';

/// 현재 사용자 정보 (GET /v1/users/me 응답. 보호자 인증 완료 폴링용)
@freezed
abstract class UserMeEntity with _$UserMeEntity {
  const factory UserMeEntity({
    required String publicCode,
    String? email,
    String? nickname,
    required String status, // ACTIVE | WITHDRAWN
    String? ageGroup, // ADULT | MINOR | null(미완료)
    DateTime? guardianVerifiedAt, // null일경우 미완료
  }) = _UserMeEntity;
}
