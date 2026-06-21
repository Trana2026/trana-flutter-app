// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_ai_extraction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractAiExtractionDto _$ContractAiExtractionDtoFromJson(
  Map<String, dynamic> json,
) => _ContractAiExtractionDto(
  extractionId: (json['extractionId'] as num).toInt(),
  status: json['status'] as String,
  model: json['model'] as String,
  promptVersion: json['promptVersion'] as String,
  prefill: json['prefill'] as Map<String, dynamic>?,
  latencyMs: (json['latencyMs'] as num?)?.toInt(),
  usage: json['usage'] as Map<String, dynamic>?,
  errorMessage: json['errorMessage'] as String?,
  extractedAt: DateTime.parse(json['extractedAt'] as String),
);

Map<String, dynamic> _$ContractAiExtractionDtoToJson(
  _ContractAiExtractionDto instance,
) => <String, dynamic>{
  'extractionId': instance.extractionId,
  'status': instance.status,
  'model': instance.model,
  'promptVersion': instance.promptVersion,
  'prefill': instance.prefill,
  'latencyMs': instance.latencyMs,
  'usage': instance.usage,
  'errorMessage': instance.errorMessage,
  'extractedAt': instance.extractedAt.toIso8601String(),
};
