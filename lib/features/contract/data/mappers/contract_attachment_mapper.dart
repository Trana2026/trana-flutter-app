import 'package:trana/features/contract/data/dtos/contract_attachment_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_attachment_entity.dart';

extension ContractAttachmentMapper on ContractAttachmentDto {
  ContractAttachmentEntity toEntity() {
    return ContractAttachmentEntity(
      id: id,
      s3Key: s3Key,
      originalFilename: originalFilename,
      contentType: contentType,
      sizeBytes: sizeBytes,
      sha256: sha256,
      sortOrder: sortOrder,
      uploadedAt: uploadedAt,
      viewUrl: viewUrl,
    );
  }
}
