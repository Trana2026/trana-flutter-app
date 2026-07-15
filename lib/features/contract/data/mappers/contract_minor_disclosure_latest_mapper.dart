import 'package:trana/features/contract/data/dtos/contract_minor_disclosure_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_minor_disclosure_entity.dart';

extension ContractMinorDisclosureLatestMapper on ContractMinorDisclosureDto {
  ContractMinorDisclosureEntity toEntity() {
    return ContractMinorDisclosureEntity(
      version: version,
      title: title,
      items: items,
    );
  }
}
