import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_attachment_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_s3_data_source.dart';
import 'package:trana/features/contract/data/dtos/contract_presign_dto.dart';
import 'package:trana/features/contract/data/mappers/contract_attachment_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_attachment_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_attachment_repository.dart';

class ContractAttachmentRepositoryImpl implements ContractAttachmentRepository {
  const ContractAttachmentRepositoryImpl(this.dataSource, this.s3DataSource);

  final ContractAttachmentDataSource dataSource;
  final ContractS3DataSource s3DataSource;

  @override
  Future<Result<ContractAttachmentEntity>> uploadAttachment({
    required String publicCode,
    required Uint8List bytes,
    required String filename,
    required String contentType,
  }) async {
    // 1. presigned URL 발급
    final ContractPresignDto presignDto;
    try {
      presignDto = await dataSource.presign(
        publicCode: publicCode,
        contentType: contentType,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(
          ForbiddenFailure('본인이 작성한 계약만 첨부파일을 업로드할 수 있습니다.'),
        );
      }
      if (e.response?.statusCode == 409) {
        return const Failure(
          ConflictFailure('DRAFT 상태이거나 첨부파일이 최대 개수를 초과했습니다.'),
        );
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }

    // 2. S3 직접 업로드
    try {
      await s3DataSource.upload(
        uploadUrl: presignDto.uploadUrl,
        bytes: bytes,
        contentType: contentType,
      );
    } on DioException {
      return const Failure(ServerFailure('파일 업로드에 실패했습니다.'));
    } catch (e) {
      return const Failure(UnknownFailure());
    }

    // 3. 서버에 메타 등록
    try {
      final metaDto = await dataSource.meta(
        publicCode: publicCode,
        s3Key: presignDto.s3Key,
        originalFilename: filename,
        contentType: contentType,
        sizeBytes: bytes.length,
      );
      return Success(metaDto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(
          ForbiddenFailure('본인이 작성한 계약만 첨부파일을 업로드할 수 있습니다.'),
        );
      }
      if (e.response?.statusCode == 409) {
        return const Failure(
          ConflictFailure('DRAFT 상태이거나 첨부파일이 최대 개수를 초과했습니다.'),
        );
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<List<ContractAttachmentEntity>>> readAttachments(
    String publicCode,
  ) async {
    try {
      final dtos = await dataSource.readAttachments(publicCode);
      return Success(dtos.map((dto) => dto.toEntity()).toList());
    } on DioException catch (e) {
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> deleteAttachment(
    String publicCode,
    int attachmentId,
  ) async {
    try {
      await dataSource.deleteAttachment(publicCode, attachmentId);
      return const Success(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Failure(NotFoundFailure('첨부파일을 찾을 수 없습니다.'));
      }
      if (e.response?.statusCode == 409) {
        return const Failure(ConflictFailure('DRAFT 상태에서만 첨부파일을 삭제할 수 있습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
