import 'package:trana/core/error/result.dart';
import 'package:trana/features/ekyc/domain/repositories/ekyc_repository.dart';

/// 휴대폰 번호 기록
class SubmitPhoneUseCase {
  final EkycRepository _repository;
  const SubmitPhoneUseCase(this._repository);

  Future<Result<void>> call({
    required String requestId,
    required String phone,
  }) =>
      _repository.submitPhone(requestId: requestId, phone: phone);
}
