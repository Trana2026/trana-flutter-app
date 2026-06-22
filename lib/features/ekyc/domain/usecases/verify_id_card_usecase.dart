import 'package:trana/core/error/result.dart';
import 'package:trana/features/ekyc/domain/entities/verify_result_entity.dart';
import 'package:trana/features/ekyc/domain/repositories/ekyc_repository.dart';

/// 신분증 진위확인
class VerifyIdCardUseCase {
  final EkycRepository _repository;
  const VerifyIdCardUseCase(this._repository);

  Future<Result<VerifyResultEntity>> call({required String requestId}) =>
      _repository.verifyIdCard(requestId: requestId);
}
