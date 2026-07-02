// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_dispute_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractDisputeDto _$ContractDisputeDtoFromJson(Map<String, dynamic> json) =>
    _ContractDisputeDto(
      disputeId: (json['disputeId'] as num).toInt(),
      reason: json['reason'] as String,
      detail: json['detail'] as String,
      status: json['status'] as String,
      reportedAt: DateTime.parse(json['reportedAt'] as String),
      cancelledAt: json['cancelledAt'] == null
          ? null
          : DateTime.parse(json['cancelledAt'] as String),
      isMine: json['isMine'] as bool,
    );

Map<String, dynamic> _$ContractDisputeDtoToJson(_ContractDisputeDto instance) =>
    <String, dynamic>{
      'disputeId': instance.disputeId,
      'reason': instance.reason,
      'detail': instance.detail,
      'status': instance.status,
      'reportedAt': instance.reportedAt.toIso8601String(),
      'cancelledAt': instance.cancelledAt?.toIso8601String(),
      'isMine': instance.isMine,
    };

_ContractDisputeListDto _$ContractDisputeListDtoFromJson(
  Map<String, dynamic> json,
) => _ContractDisputeListDto(
  disputes: (json['disputes'] as List<dynamic>)
      .map((e) => ContractDisputeDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ContractDisputeListDtoToJson(
  _ContractDisputeListDto instance,
) => <String, dynamic>{'disputes': instance.disputes};
