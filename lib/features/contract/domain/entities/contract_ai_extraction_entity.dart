import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_ai_extraction_entity.freezed.dart';

@freezed
abstract class ContractAiExtractionEntity with _$ContractAiExtractionEntity {
  const factory ContractAiExtractionEntity({
    required int extractionId,
    required String status,
    required String model,
    required String promptVersion,
    Map<String, dynamic>? prefill,
    int? latencyMs,
    Map<String, dynamic>? usage,
    String? errorMessage,
    required DateTime extractedAt,
  }) = _ContractAiExtractionEntity;
}
