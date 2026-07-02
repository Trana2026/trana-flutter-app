import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_cancellation_entity.dart';

abstract interface class ContractCancellationRepository {
  Future<Result<ContractCancellationEntity>> requestCancellation({
    required String publicCode,
    required String reason,
    required String detail,
  });

  Future<Result<bool>> confirmCancellation(String publicCode);

  /// 200 = 활성 요청 반환, 204 = null 반환
  Future<Result<ContractCancellationEntity?>> readActiveCancellation(
    String publicCode,
  );
}
