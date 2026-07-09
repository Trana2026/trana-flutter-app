import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/entities/user_preference_entity.dart';

abstract interface class UserPreferenceRepository {
  Future<Result<UserPreferenceEntity>> togglePushEnabled(bool enabled);
}
