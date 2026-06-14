import 'dart:typed_data';

import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_attachment_entity.dart';

abstract interface class ContractAttachmentRepository {
  Future<Result<ContractAttachmentEntity>> uploadAttachment({
    required String publicCode,
    required Uint8List bytes,
    required String filename,
    required String contentType,
  });

  Future<Result<List<ContractAttachmentEntity>>> readAttachments(
    String publicCode,
  );

  Future<Result<void>> deleteAttachment(String publicCode, int attachmentId);
}
