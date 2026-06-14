import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_guardian_consent_approve_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_guardian_consent_link_entity.dart';

abstract interface class ContractGuardianConsentRepository {
  Future<Result<ContractGuardianConsentLinkEntity>> createLink(
    String publicCode,
  );

  Future<Result<ContractGuardianConsentApproveEntity>> approve({
    required String token,
  });
}
