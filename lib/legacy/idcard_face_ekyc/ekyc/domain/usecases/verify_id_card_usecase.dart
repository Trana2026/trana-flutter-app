import 'package:trana/core/error/result.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/repositories/legacy_ekyc_repository.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/domain/entities/verify_result_entity.dart';

/// 신분증 진위확인
class VerifyIdCardUseCase {
  final LegacyEkycRepository _repository;
  const VerifyIdCardUseCase(this._repository);

  Future<Result<VerifyResultEntity>> call({required String requestId}) =>
      _repository.verifyIdCard(requestId: requestId);
}
