import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/contract/domain/enums/age_group.dart';
import 'package:trana/features/profile/data/dtos/user_info_dto.dart';
import 'package:trana/features/profile/domain/entities/user_info_entity.dart';
import 'package:trana/features/profile/domain/enums/gender.dart';
import 'package:trana/features/profile/domain/enums/user_status.dart';

extension UserInfoMapper on UserInfoDto {
  UserInfoEntity toEntity() {
    return UserInfoEntity(
      publicCode: publicCode,
      email: email,
      status: UserStatus.values.fromApiString(status),
      ageGroup: AgeGroup.values.fromApiString(ageGroup),
      guardianVerifiedAt: guardianVerifiedAt,
      name: name,
      birthDate: birthDate,
      gender: gender != null ? Gender.values.fromApiString(gender!) : null,
      phone: phone,
      pushEnabled: pushEnabled,
    );
  }
}
