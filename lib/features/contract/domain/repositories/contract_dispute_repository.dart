import 'dart:typed_data';

import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_dispute_entity.dart';

abstract interface class ContractDisputeRepository {
  Future<Result<List<ContractDisputeEntity>>> readDisputes(String publicCode);

  Future<Result<ContractDisputeEntity>> reportDispute({
    required String publicCode,
    required String reason,
    required String detail,
  });

  Future<Result<Uint8List>> downloadEvidencePackage(String publicCode);

  Future<Result<bool>> cancelDispute({
    required String publicCode,
    required int disputeId,
  });
}
