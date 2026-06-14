import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_ai_extraction_dto.freezed.dart';
part 'contract_ai_extraction_dto.g.dart';

@freezed
abstract class ContractAiExtractionDto with _$ContractAiExtractionDto {
  const factory ContractAiExtractionDto({
    required int extractionId,
    required String status,
    required String model,
    required String promptVersion,
    Map<String, dynamic>? prefill,
    int? latencyMs,
    Map<String, dynamic>? usage,
    String? errorMessage,
    required DateTime extractedAt,
  }) = _ContractAiExtractionDto;

  factory ContractAiExtractionDto.fromJson(Map<String, dynamic> json) =>
      _$ContractAiExtractionDtoFromJson(json);
}
