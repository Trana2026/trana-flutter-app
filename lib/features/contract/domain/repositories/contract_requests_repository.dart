import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_requests_entity.dart';

abstract interface class ContractRequestsRepository {
  /// 계약 요청 생성 > 초대 토큰 반환
  Future<Result<String>> createRequest(int contractId);

  /// 계약 요청 조회
  Future<Result<ContractRequestsEntity?>> readRequest(String token);

  /// 계약 요청 목록 조회
  Future<Result<List<ContractRequestsEntity>>> readRequests();

  /// 계약 요청 삭제
  Future<Result<void>> deleteRequest(int contractId);
}
