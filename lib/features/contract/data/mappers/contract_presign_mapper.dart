import 'package:trana/features/contract/data/dtos/contract_presign_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_presign_entity.dart';

extension ContractPresignMapper on ContractPresignDto {
  ContractPresignEntity toEntity() {
    return ContractPresignEntity(
      uploadUrl: uploadUrl,
      s3Key: s3Key,
      expiresAt: expiresAt,
    );
  }
}
