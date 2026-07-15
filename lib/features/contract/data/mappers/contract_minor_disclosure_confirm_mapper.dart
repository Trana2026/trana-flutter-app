import 'package:trana/features/contract/data/dtos/contract_minor_disclosure_confirm_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_minor_disclosure_confirm_entity.dart';

extension ContractMinorDisclosureConfirmMapper
    on ContractMinorDisclosureConfirmDto {
  ContractMinorDisclosureConfirmEntity toEntity() {
    return ContractMinorDisclosureConfirmEntity(
      confirmedAt: confirmedAt,
      templateVersion: templateVersion,
    );
  }
}
