import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_pdf_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_pdf_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_pdf_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_pdf_repository.dart';

class ContractPdfRepositoryImpl implements ContractPdfRepository {
  const ContractPdfRepositoryImpl(this.dataSource);

  final ContractPdfDataSource dataSource;

  @override
  Future<Result<Uint8List>> preview({required String publicCode}) async {
    try {
      final bytes = await dataSource.preview(publicCode);
      return Success(bytes);
    } on DioException catch (e) {
      debugPrint(
        '[PdfRepo] preview: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      final errorCode = _errorCode(e);
      if (errorCode == 'CONTRACT_400_NOT_READY') {
        return const Failure(
          ValidationFailure('필수 필드가 누락되어 미리보기를 생성할 수 없습니다.'),
        );
      }
      if (errorCode == 'CONTRACT_409_NOT_DRAFT') {
        return const Failure(ConflictFailure('DRAFT 상태이거나 보호자 동의가 미완료입니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[PdfRepo] preview unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractPdfEntity>> pdf({required String publicCode}) async {
    try {
      final dto = await dataSource.pdf(publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      debugPrint(
        '[PdfRepo] pdf: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      final errorCode = _errorCode(e);
      if (errorCode == 'CONTRACT_403_NOT_ACCESSIBLE') {
        return const Failure(ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'));
      }
      if (errorCode == 'CONTRACT_409_PDF_NOT_GENERATED') {
        return const Failure(
          ConflictFailure('PDF가 아직 생성되지 않았습니다. markReady가 선행되어야 합니다.'),
        );
      }
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[PdfRepo] pdf unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<Uint8List>> downloadBytes(String url) async {
    try {
      final bytes = await dataSource.downloadBytes(url);
      return Success(bytes);
    } on DioException catch (e) {
      debugPrint('[PdfRepo] downloadBytes: ${e.type} ${e.response?.statusCode}');
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[PdfRepo] downloadBytes unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  String? _errorCode(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) return data['code'] as String?;
    return null;
  }
}
