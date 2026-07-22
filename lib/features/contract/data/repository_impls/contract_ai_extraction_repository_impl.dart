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
    final requestResult = await guardResult(
      () async {
        final dto = await dataSource.requestPrefill(
          publicCode,
          attachmentIds: attachmentIds,
          consentedAt: consentedAt,
        );
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('사진은 1~2장만 AI 분석에 사용할 수 있습니다.'),
        404 => const NotFoundFailure('첨부파일이 본 계약 소속이 아니거나 존재하지 않습니다.'),
        409 => const ConflictFailure('DRAFT 상태에서만 AI 추출을 요청할 수 있습니다.'),
        _ => null,
      },
    );
    final ContractAiExtractionEntity extraction;
    switch (requestResult) {
      case Success(:final data):
        extraction = data;
      case Failure(:final failure):
        return Failure(failure);
    }

    // 2. SUCCESS / FAILED 까지 polling (최대 20회, 2초 간격)
    var current = extraction;
    const maxRetries = 20;
    for (var i = 0; i < maxRetries; i++) {
      if (current.status == 'SUCCESS' || current.status == 'FAILED') break;

      await Future.delayed(const Duration(seconds: 2));

      final pollResult = await guardResult(
        () async {
          final dto = await dataSource.polling(
            publicCode,
            current.extractionId,
          );
          return dto.toEntity();
        },
        onDioException: (e) => switch (e.response?.statusCode) {
          404 => const NotFoundFailure('본 계약 소속이 아닌 extractionId입니다.'),
          _ => null,
        },
      );
      switch (pollResult) {
        case Success(:final data):
          current = data;
        case Failure(:final failure):
          return Failure(failure);
      }
    }

    if (current.status != 'SUCCESS') {
      return const Failure(ServerFailure('AI 분석에 실패했습니다.'));
    }

    // 3. 최종 결과 로드
    final loadResult = await guardResult(() {
      return dataSource.loadPrefill(publicCode);
    });
    return loadResult.fold(
      onSuccess: (dto) => dto == null
          ? const Failure(NotFoundFailure('AI 분석 결과를 찾을 수 없습니다.'))
          : Success(dto.toEntity()),
      onFailure: (failure) => Failure(failure),
    );
  }
}
