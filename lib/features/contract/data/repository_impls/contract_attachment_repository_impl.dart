import 'dart:typed_data';

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
    final presignResult = await guardResult(
      () {
        return dataSource.presign(
          publicCode: publicCode,
          contentType: contentType,
        );
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('본인이 작성한 계약만 첨부파일을 업로드할 수 있습니다.'),
        409 => const ConflictFailure('DRAFT 상태이거나 첨부파일이 최대 개수를 초과했습니다.'),
        _ => null,
      },
    );
    final ContractPresignDto presignDto;
    switch (presignResult) {
      case Success(:final data):
        presignDto = data;
      case Failure(:final failure):
        return Failure(failure);
    }

    // 2. S3 직접 업로드
    final uploadResult = await guardResult(() {
      return s3DataSource.upload(
        uploadUrl: presignDto.uploadUrl,
        bytes: bytes,
        contentType: contentType,
      );
    }, onDioException: (_) => const ServerFailure('파일 업로드에 실패했습니다.'));
    switch (uploadResult) {
      case Success():
        break;
      case Failure(:final failure):
        return Failure(failure);
    }

    // 3. 서버에 메타 등록
    return guardResult(
      () async {
        final metaDto = await dataSource.meta(
          publicCode: publicCode,
          s3Key: presignDto.s3Key,
          originalFilename: filename,
          contentType: contentType,
          sizeBytes: bytes.length,
        );
        return metaDto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('본인이 작성한 계약만 첨부파일을 업로드할 수 있습니다.'),
        409 => const ConflictFailure('DRAFT 상태이거나 첨부파일이 최대 개수를 초과했습니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<List<ContractAttachmentEntity>>> readAttachments(
    String publicCode,
  ) {
    return guardResult(() async {
      final dtos = await dataSource.readAttachments(publicCode);
      return dtos.map((dto) => dto.toEntity()).toList();
    });
  }

  @override
  Future<Result<void>> deleteAttachment(String publicCode, int attachmentId) {
    return guardResult(
      () {
        return dataSource.deleteAttachment(publicCode, attachmentId);
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        404 => const NotFoundFailure('첨부파일을 찾을 수 없습니다.'),
        409 => const ConflictFailure('DRAFT 상태에서만 첨부파일을 삭제할 수 있습니다.'),
        _ => null,
      },
    );
  }
}
