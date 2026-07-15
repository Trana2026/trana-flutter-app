import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_cancellation_entity.dart';

abstract interface class ContractCancellationRepository {
  Future<Result<ContractCancellationEntity>> requestCancellation({
    required String publicCode,
    required String reason,
    required String detail,
  });

  Future<Result<bool>> confirmCancellation(String publicCode);

  Future<Result<void>> revokeCancellation(String publicCode);

  Future<Result<ContractCancellationEntity?>> readActiveCancellation(
    String publicCode,
  );
}
