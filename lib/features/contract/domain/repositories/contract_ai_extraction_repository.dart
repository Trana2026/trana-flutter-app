import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_ai_extraction_entity.dart';

abstract interface class ContractAiExtractionRepository {
  /// requestPrefill → polling → loadPrefill 전체 흐름
  Future<Result<ContractAiExtractionEntity>> analyzeImages(
    String publicCode, {
    required List<int> attachmentIds,
    required DateTime consentedAt,
  });
}
