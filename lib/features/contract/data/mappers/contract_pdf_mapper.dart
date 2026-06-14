import 'package:trana/features/contract/data/dtos/contract_pdf_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_pdf_entity.dart';

extension ContractPdfMapper on ContractPdfDto {
  ContractPdfEntity toEntity() {
    return ContractPdfEntity(
      downloadUrl: downloadUrl,
      expiresInSeconds: expiresInSeconds,
      sha256: sha256,
    );
  }
}
