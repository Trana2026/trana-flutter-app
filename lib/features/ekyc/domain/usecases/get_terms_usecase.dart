import 'package:trana/core/error/result.dart';
import 'package:trana/features/ekyc/domain/entities/terms_entity.dart';
import 'package:trana/features/ekyc/domain/repositories/ekyc_repository.dart';

/// 활성 약관 목록 조회
class GetTermsUseCase {
  final EkycRepository _repository;
  const GetTermsUseCase(this._repository);

  Future<Result<List<TermsEntity>>> call() => _repository.getTerms();
}
