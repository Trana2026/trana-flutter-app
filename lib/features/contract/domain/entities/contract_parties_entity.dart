import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/contract/domain/enums/party_type.dart';

part 'contract_parties_entity.freezed.dart';

/// 계약 당사자
@freezed
abstract class ContractPartiesEntity with _$ContractPartiesEntity {
  const factory ContractPartiesEntity({
    int? id,
    required int contractId, // 계약 ID
    required int userId, // 사용자 ID
    required Role role, // 역할
    required PartyType partyType, // 계약 당사자 유형 (요청자/수신자)
    required bool validated, // 해당 거래 내 인증 여부 (false: 미성년자 미인증 시)
    DateTime? signedAt, // 서명 일시
    required DateTime createdAt,

    // DateTime? completedAt, // 완료 확정 일시
  }) = _ContractPartiesEntity;
}
