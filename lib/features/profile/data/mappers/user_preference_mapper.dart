import 'package:trana/features/profile/data/dtos/user_preference_dto.dart';
import 'package:trana/features/profile/domain/entities/user_preference_entity.dart';

extension UserPreferenceMapper on UserPreferenceDto {
  UserPreferenceEntity toEntity() {
    return UserPreferenceEntity(pushEnabled: pushEnabled);
  }
}
