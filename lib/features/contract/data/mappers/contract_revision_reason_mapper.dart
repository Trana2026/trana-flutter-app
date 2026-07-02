import 'package:trana/features/contract/data/dtos/contract_revision_reason_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_revision_reason_entity.dart';

extension ContractRevisionReasonMapper on ContractRevisionReasonDto {
  ContractRevisionReasonEntity toEntity() {
    return ContractRevisionReasonEntity(
      requesterUserId: requesterUserId,
      deliveryTypeReason: deliveryTypeReason,
      tradingPlatformReason: tradingPlatformReason,
      titleReason: titleReason,
      priceReason: priceReason,
      conditionSummaryReason: conditionSummaryReason,
      conditionDetailsReason: conditionDetailsReason,
      requestedAt: requestedAt,
    );
  }
}
