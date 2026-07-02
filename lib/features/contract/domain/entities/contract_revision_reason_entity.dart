import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_revision_reason_entity.freezed.dart';

@freezed
abstract class ContractRevisionReasonEntity
    with _$ContractRevisionReasonEntity {
  const factory ContractRevisionReasonEntity({
    required int requesterUserId,
    String? deliveryTypeReason,
    String? tradingPlatformReason,
    String? titleReason,
    String? priceReason,
    String? conditionSummaryReason,
    String? conditionDetailsReason,
    required DateTime requestedAt,
  }) = _ContractRevisionReasonEntity;
}
