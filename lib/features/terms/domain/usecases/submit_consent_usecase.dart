import 'package:trana/core/error/result.dart';
import 'package:trana/features/terms/domain/entities/consent_result_entity.dart';
import 'package:trana/features/terms/domain/repositories/terms_repository.dart';

/// 약관 동의 및 signupSessionId 발급
class SubmitConsentUseCase {
  final TermsRepository _repository;
  const SubmitConsentUseCase(this._repository);

  Future<Result<ConsentResultEntity>> call({
    required List<int> termsVersionIds,
    required String contextType,
    required String ageGroup,
  }) =>
      _repository.submitConsent(
        termsVersionIds: termsVersionIds,
        contextType: contextType,
        ageGroup: ageGroup,
      );
}
