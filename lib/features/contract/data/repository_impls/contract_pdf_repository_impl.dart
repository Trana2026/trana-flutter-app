import 'dart:typed_data';

import 'package:dio/dio.dart';
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
      if (e.response?.statusCode == 400) {
        return const Failure(
          ValidationFailure('필수 필드가 누락되어 미리보기를 생성할 수 없습니다.'),
        );
      }
      if (e.response?.statusCode == 409) {
        return const Failure(ConflictFailure('DRAFT 상태이거나 보호자 동의가 미완료입니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractPdfEntity>> pdf({required String publicCode}) async {
    try {
      final dto = await dataSource.pdf(publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'));
      }
      if (e.response?.statusCode == 409) {
        return const Failure(
          ConflictFailure('PDF가 아직 생성되지 않았습니다. markReady가 선행되어야 합니다.'),
        );
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<Uint8List>> downloadBytes(String url) async {
    try {
      final bytes = await dataSource.downloadBytes(url);
      return Success(bytes);
    } on DioException catch (e) {
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
