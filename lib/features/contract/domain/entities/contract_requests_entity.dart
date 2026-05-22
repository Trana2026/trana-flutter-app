import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_requests_entity.freezed.dart';

/// 계약 요청
@freezed
abstract class ContractRequestsEntity with _$ContractRequestsEntity {
  const factory ContractRequestsEntity({
    required int contractId, // 계약 ID
    required String token, // 초대 토큰
    required DateTime createdAt,
  }) = _ContractInviteEntity;
}
