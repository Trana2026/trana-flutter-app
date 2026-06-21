import 'package:trana/core/error/result.dart';
import 'package:trana/features/guardian/domain/entities/user_me_entity.dart';
import 'package:trana/features/guardian/domain/repositories/guardian_repository.dart';

/// 보호자 인증 완료 여부 조회 (guardianVerifiedAt != null 확인)
class PollGuardianVerifiedUseCase {
  final GuardianRepository _repository;
  const PollGuardianVerifiedUseCase(this._repository);

  Future<Result<UserMeEntity>> call() => _repository.getMe();
}
