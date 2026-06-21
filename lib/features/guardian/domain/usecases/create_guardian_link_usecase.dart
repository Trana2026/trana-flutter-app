import 'package:trana/core/error/result.dart';
import 'package:trana/features/guardian/domain/entities/guardian_link_entity.dart';
import 'package:trana/features/guardian/domain/repositories/guardian_repository.dart';

/// 보호자 인증 링크 발급
class CreateGuardianLinkUseCase {
  final GuardianRepository _repository;
  const CreateGuardianLinkUseCase(this._repository);

  Future<Result<GuardianLinkEntity>> call() => _repository.createGuardianLink();
}
