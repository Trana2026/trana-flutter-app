import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_parties_entity.dart';

abstract interface class ContractPartiesRepository {
  /// 계약 당사자 생성
  Future<Result<void>> createContractParty(ContractPartiesEntity party);

  /// 계약 당사자 목록 조회
  Future<Result<List<ContractPartiesEntity>>> readContractParties(
    int contractId,
  );

  /// 계약 당사자 수정
  Future<Result<void>> updateContractParty(ContractPartiesEntity party);
}
