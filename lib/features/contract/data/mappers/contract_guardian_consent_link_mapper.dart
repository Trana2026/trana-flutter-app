import 'package:trana/features/contract/data/dtos/contract_guardian_consent_link_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_guardian_consent_link_entity.dart';

extension ContractGuardianConsentLinkMapper on ContractGuardianConsentLinkDto {
  ContractGuardianConsentLinkEntity toEntity() {
    return ContractGuardianConsentLinkEntity(
      token: token,
      expiresAt: expiresAt,
      verifyUrl: verifyUrl,
    );
  }
}
