import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/entities/user_consent_entity.dart';

abstract interface class UserConsentRepository {
  Future<Result<List<UserConsentEntity>>> readConsents();
}
