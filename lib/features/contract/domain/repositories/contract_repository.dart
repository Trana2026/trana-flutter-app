import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_entity.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';

abstract interface class ContractRepository {
  Future<Result<List<ContractEntity>>> readMyContracts({
    ContractStatus? status,
    String? query,
  });
}
