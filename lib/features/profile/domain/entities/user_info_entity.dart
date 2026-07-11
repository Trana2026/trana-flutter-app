import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/contract/domain/enums/age_group.dart';
import 'package:trana/features/profile/domain/enums/gender.dart';
import 'package:trana/features/profile/domain/enums/user_status.dart';

part 'user_info_entity.freezed.dart';

@freezed
abstract class UserInfoEntity with _$UserInfoEntity {
  const factory UserInfoEntity({
    required String publicCode,
    String? email,
    required UserStatus status,
    required AgeGroup ageGroup,
    DateTime? guardianVerifiedAt,
    String? name,
    String? birthDate,
    required Gender gender,
    String? phone,
    required bool pushEnabled,
  }) = _UserInfoEntity;
}
