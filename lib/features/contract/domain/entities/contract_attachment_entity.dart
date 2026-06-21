import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_attachment_entity.freezed.dart';

@freezed
abstract class ContractAttachmentEntity with _$ContractAttachmentEntity {
  const factory ContractAttachmentEntity({
    required int id,
    required String s3Key,
    required String originalFilename,
    required String contentType,
    required int sizeBytes,
    required String sha256,
    required int sortOrder,
    required DateTime uploadedAt,
    String? viewUrl,
  }) = _ContractAttachmentEntity;
}
