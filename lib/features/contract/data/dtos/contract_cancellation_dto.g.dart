// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_cancellation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractCancellationDto _$ContractCancellationDtoFromJson(
  Map<String, dynamic> json,
) => _ContractCancellationDto(
  cancellationRequestId: (json['cancellationRequestId'] as num).toInt(),
  reason: json['reason'] as String,
  detail: json['detail'] as String,
  status: json['status'] as String,
  requestedAt: DateTime.parse(json['requestedAt'] as String),
  confirmedAt: json['confirmedAt'] == null
      ? null
      : DateTime.parse(json['confirmedAt'] as String),
  isMine: json['isMine'] as bool,
);

Map<String, dynamic> _$ContractCancellationDtoToJson(
  _ContractCancellationDto instance,
) => <String, dynamic>{
  'cancellationRequestId': instance.cancellationRequestId,
  'reason': instance.reason,
  'detail': instance.detail,
  'status': instance.status,
  'requestedAt': instance.requestedAt.toIso8601String(),
  'confirmedAt': instance.confirmedAt?.toIso8601String(),
  'isMine': instance.isMine,
};
