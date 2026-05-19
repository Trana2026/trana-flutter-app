import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contracts_entity.dart';

abstract interface class ContractsRepository {
  /// 계약 생성 > 계약 ID 반환
  Future<Result<int>> createContract(ContractsEntity contract);

  /// 계약 조회
  Future<Result<ContractsEntity>> readContract(int contractId);

  /// 계약 목록 조회 (전체)
  Future<Result<List<ContractsEntity>>> readContracts(int userId);

  /// 계약 목록 조회 (최근 n일 이내)
  Future<Result<List<ContractsEntity>>> readRecentContracts(
    int userId,
    int days,
  );

  /// 계약 수정
  Future<Result<void>> updateContract(ContractsEntity contract);

  /// 계약 삭제
  Future<Result<void>> deleteContract(int id);
}
