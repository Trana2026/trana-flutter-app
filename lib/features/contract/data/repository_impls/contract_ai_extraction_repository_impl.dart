import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_ai_extraction_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_ai_extraction_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_ai_extraction_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_ai_extraction_repository.dart';

class ContractAiExtractionRepositoryImpl
    implements ContractAiExtractionRepository {
  const ContractAiExtractionRepositoryImpl(this.dataSource);

  final ContractAiExtractionDataSource dataSource;

  @override
  Future<Result<ContractAiExtractionEntity>> analyzeImages(
    String publicCode, {
    required List<int> attachmentIds,
    required DateTime consentedAt,
  }) async {
    // 1. 추출 요청
    final ContractAiExtractionEntity extraction;
    try {
      final dto = await dataSource.requestPrefill(
        publicCode,
        attachmentIds: attachmentIds,
        consentedAt: consentedAt,
      );
      extraction = dto.toEntity();
    } on DioException catch (e) {
      debugPrint(
        '[AiExtractionRepo] requestPrefill: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      final errorCode = _errorCode(e);
      if (errorCode == 'CONTRACT_400_AI_IMAGE_COUNT') {
        return const Failure(ValidationFailure('사진은 1~2장만 AI 분석에 사용할 수 있습니다.'));
      }
      if (errorCode == 'CONTRACT_409_NOT_DRAFT') {
        return const Failure(ConflictFailure('DRAFT 상태에서만 AI 추출을 요청할 수 있습니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(NotFoundFailure('첨부파일이 본 계약 소속이 아니거나 존재하지 않습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[AiExtractionRepo] requestPrefill unexpected: $e');
      return const Failure(UnknownFailure());
    }

    // 2. COMPLETED / FAILED 까지 polling (최대 20회, 2초 간격)
    var current = extraction;
    const maxRetries = 20;
    for (var i = 0; i < maxRetries; i++) {
      if (current.status == 'SUCCESS' || current.status == 'FAILED') break;

      await Future.delayed(const Duration(seconds: 2));

      try {
        final dto = await dataSource.polling(publicCode, current.extractionId);
        current = dto.toEntity();
      } on DioException catch (e) {
        debugPrint(
          '[AiExtractionRepo] polling: ${e.type} ${e.response?.statusCode} ${e.message}',
        );
        if (e.response?.statusCode == 404) {
          return const Failure(NotFoundFailure('본 계약 소속이 아닌 extractionId입니다.'));
        }
        return Failure(e.toFailure());
      } catch (e) {
        debugPrint('[AiExtractionRepo] polling unexpected: $e');
        return const Failure(UnknownFailure());
      }
    }

    if (current.status != 'SUCCESS') {
      debugPrint(
        '[AiExtractionRepo] analyzeImages: timed out or failed (status=${current.status})',
      );
      return const Failure(ServerFailure('AI 분석에 실패했습니다.'));
    }

    // 3. 최종 결과 로드
    try {
      final dto = await dataSource.loadPrefill(publicCode);
      if (dto == null) {
        return const Failure(NotFoundFailure('AI 분석 결과를 찾을 수 없습니다.'));
      }
      return Success(dto.toEntity());
    } on DioException catch (e) {
      debugPrint(
        '[AiExtractionRepo] loadPrefill: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[AiExtractionRepo] loadPrefill unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  String? _errorCode(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) return data['code'] as String?;
    return null;
  }
}
