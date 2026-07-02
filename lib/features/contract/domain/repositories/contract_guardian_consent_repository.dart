import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_guardian_consent_approve_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_guardian_consent_link_entity.dart';

abstract interface class ContractGuardianConsentRepository {
  Future<Result<ContractGuardianConsentLinkEntity>> guardianConsent(
    String publicCode,
  );

  Future<Result<ContractGuardianConsentApproveEntity>> approve({
    required String token,
  });

  Future<Result<ContractGuardianConsentLinkEntity>> receiverGuardianConsent(
    String publicCode,
  );
}
