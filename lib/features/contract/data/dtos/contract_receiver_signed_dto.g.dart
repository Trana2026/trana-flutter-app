// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_receiver_signed_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractReceiverSignedDto _$ContractReceiverSignedDtoFromJson(
  Map<String, dynamic> json,
) => _ContractReceiverSignedDto(
  publicCode: json['publicCode'] as String,
  status: json['status'] as String,
  pdfVersion: (json['pdfVersion'] as num).toInt(),
  receiverSignedAt: DateTime.parse(json['receiverSignedAt'] as String),
);

Map<String, dynamic> _$ContractReceiverSignedDtoToJson(
  _ContractReceiverSignedDto instance,
) => <String, dynamic>{
  'publicCode': instance.publicCode,
  'status': instance.status,
  'pdfVersion': instance.pdfVersion,
  'receiverSignedAt': instance.receiverSignedAt.toIso8601String(),
};
