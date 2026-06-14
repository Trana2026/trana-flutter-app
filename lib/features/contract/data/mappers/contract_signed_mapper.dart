import 'package:trana/core/utils/enum_extension.dart';
import 'package:trana/features/contract/data/dtos/contract_signed_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_signed_entity.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';

extension ContractSignedMapper on ContractSignedDto {
  ContractSignedEntity toEntity() {
    return ContractSignedEntity(
      publicCode: publicCode,
      status: ContractStatus.values.fromApiString(status),
      pdfVersion: pdfVersion,
      creatorSignedAt: creatorSignedAt,
    );
  }
}
