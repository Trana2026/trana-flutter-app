import 'package:trana/core/error/result.dart';
import 'package:trana/features/terms/domain/entities/terms_entity.dart';
import 'package:trana/features/terms/domain/repositories/terms_repository.dart';

/// 활성 약관 목록 조회
class GetTermsUseCase {
  final TermsRepository _repository;
  const GetTermsUseCase(this._repository);

  Future<Result<List<TermsEntity>>> call() => _repository.getTerms();
}
