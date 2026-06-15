import 'package:trana/features/contract/data/dtos/contract_ai_extraction_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_ai_extraction_entity.dart';

extension ContractAiExtractionMapper on ContractAiExtractionDto {
  ContractAiExtractionEntity toEntity() {
    return ContractAiExtractionEntity(
      extractionId: extractionId,
      status: status,
      model: model,
      promptVersion: promptVersion,
      prefill: prefill,
      latencyMs: latencyMs,
      usage: usage,
      errorMessage: errorMessage,
      extractedAt: extractedAt,
    );
  }
}
