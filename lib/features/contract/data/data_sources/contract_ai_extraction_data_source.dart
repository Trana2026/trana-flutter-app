import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_ai_extraction_dto.dart';

class ContractAiExtractionDataSource {
  const ContractAiExtractionDataSource(this.dio);

  final Dio dio;

  /// POST AI prefill 추출 요청 (비동기)
  Future<ContractAiExtractionDto> requestPrefill(
    String publicCode, {
    required List<int> attachmentIds,
    required DateTime consentedAt,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/ai-extractions',
      data: {
        'attachmentIds': attachmentIds,
        'consentedAt': consentedAt.toUtc().toIso8601String(),
      },
    );
    return ContractAiExtractionDto.fromJson(response.data!);
  }

  /// GET 특정 extractionId 폴링
  Future<ContractAiExtractionDto> polling(
    String publicCode,
    int extractionId,
  ) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/ai-extractions/$extractionId',
    );
    return ContractAiExtractionDto.fromJson(response.data!);
  }

  /// GET 가장 최근 AI 추출 결과 (204 = 추출 이력 없음)
  Future<ContractAiExtractionDto?> loadPrefill(String publicCode) async {
    final response = await dio.get<Map<String, dynamic>?>(
      '/v1/contracts/$publicCode/ai-extractions/latest',
    );
    if (response.data == null) return null;
    return ContractAiExtractionDto.fromJson(response.data!);
  }
}
