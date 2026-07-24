import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/contract/data/dtos/contract_dispute_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_dispute_entity.dart';
import 'package:trana/features/contract/domain/enums/dispute_state.dart';

extension ContractDisputeMapper on ContractDisputeDto {
  ContractDisputeEntity toEntity() {
    return ContractDisputeEntity(
      disputeId: disputeId,
      reason: reason,
      detail: detail,
      status: DisputeState.values.fromApiString(status, fallback: DisputeState.none),
      reportedAt: reportedAt,
      cancelledAt: cancelledAt,
      isMine: isMine,
    );
  }
}
