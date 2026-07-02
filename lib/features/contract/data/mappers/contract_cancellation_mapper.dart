import 'package:trana/features/contract/data/dtos/contract_cancellation_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_cancellation_entity.dart';

extension ContractCancellationMapper on ContractCancellationDto {
  ContractCancellationEntity toEntity() {
    return ContractCancellationEntity(
      cancellationRequestId: cancellationRequestId,
      reason: reason,
      detail: detail,
      status: status,
      requestedAt: requestedAt,
      confirmedAt: confirmedAt,
      isMine: isMine,
    );
  }
}
