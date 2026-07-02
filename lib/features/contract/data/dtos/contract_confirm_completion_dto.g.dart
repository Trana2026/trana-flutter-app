// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_confirm_completion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractConfirmCompletionDto _$ContractConfirmCompletionDtoFromJson(
  Map<String, dynamic> json,
) => _ContractConfirmCompletionDto(
  publicCode: json['publicCode'] as String,
  status: json['status'] as String,
  sellerCompletedAt: json['sellerCompletedAt'] == null
      ? null
      : DateTime.parse(json['sellerCompletedAt'] as String),
  buyerCompletedAt: json['buyerCompletedAt'] == null
      ? null
      : DateTime.parse(json['buyerCompletedAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
);

Map<String, dynamic> _$ContractConfirmCompletionDtoToJson(
  _ContractConfirmCompletionDto instance,
) => <String, dynamic>{
  'publicCode': instance.publicCode,
  'status': instance.status,
  'sellerCompletedAt': instance.sellerCompletedAt?.toIso8601String(),
  'buyerCompletedAt': instance.buyerCompletedAt?.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
};
