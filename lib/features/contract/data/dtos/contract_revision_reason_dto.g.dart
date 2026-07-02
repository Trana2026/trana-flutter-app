// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_revision_reason_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractRevisionReasonDto _$ContractRevisionReasonDtoFromJson(
  Map<String, dynamic> json,
) => _ContractRevisionReasonDto(
  requesterUserId: (json['requesterUserId'] as num).toInt(),
  deliveryTypeReason: json['deliveryTypeReason'] as String?,
  tradingPlatformReason: json['tradingPlatformReason'] as String?,
  titleReason: json['titleReason'] as String?,
  priceReason: json['priceReason'] as String?,
  conditionSummaryReason: json['conditionSummaryReason'] as String?,
  conditionDetailsReason: json['conditionDetailsReason'] as String?,
  requestedAt: DateTime.parse(json['requestedAt'] as String),
);

Map<String, dynamic> _$ContractRevisionReasonDtoToJson(
  _ContractRevisionReasonDto instance,
) => <String, dynamic>{
  'requesterUserId': instance.requesterUserId,
  'deliveryTypeReason': instance.deliveryTypeReason,
  'tradingPlatformReason': instance.tradingPlatformReason,
  'titleReason': instance.titleReason,
  'priceReason': instance.priceReason,
  'conditionSummaryReason': instance.conditionSummaryReason,
  'conditionDetailsReason': instance.conditionDetailsReason,
  'requestedAt': instance.requestedAt.toIso8601String(),
};
