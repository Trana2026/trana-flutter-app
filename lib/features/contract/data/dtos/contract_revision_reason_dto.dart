import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_revision_reason_dto.freezed.dart';
part 'contract_revision_reason_dto.g.dart';

@freezed
abstract class ContractRevisionReasonDto with _$ContractRevisionReasonDto {
  const factory ContractRevisionReasonDto({
    required int requesterUserId,
    String? deliveryTypeReason,
    String? tradingPlatformReason,
    String? titleReason,
    String? priceReason,
    String? conditionSummaryReason,
    String? conditionDetailsReason,
    required DateTime requestedAt,
  }) = _ContractRevisionReasonDto;

  factory ContractRevisionReasonDto.fromJson(Map<String, dynamic> json) =>
      _$ContractRevisionReasonDtoFromJson(json);
}
