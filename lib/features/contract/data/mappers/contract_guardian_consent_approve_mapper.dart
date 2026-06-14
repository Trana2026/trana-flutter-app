import 'package:trana/features/contract/data/dtos/contract_guardian_consent_approve_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_guardian_consent_approve_entity.dart';

extension ContractGuardianConsentApproveMapper
    on ContractGuardianConsentApproveDto {
  ContractGuardianConsentApproveEntity toEntity() {
    return ContractGuardianConsentApproveEntity(
      publicCode: publicCode,
      guardianConsentAt: guardianConsentAt,
    );
  }
}
