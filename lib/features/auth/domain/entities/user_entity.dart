import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// 사용자 계정 정보 (users 테이블 매핑)
@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String publicId,
    required String ageGroup,
    required String accountStatus,
    required String name,
    required String email,
    required String phone,
    required bool pushEnabled,
    required DateTime createdAt,
    DateTime? withdrawnAt,
  }) = _UserEntity;
}
