import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_guardian_consent_approve_entity.freezed.dart';

@freezed
abstract class ContractGuardianConsentApproveEntity
    with _$ContractGuardianConsentApproveEntity {
  const factory ContractGuardianConsentApproveEntity({
    required String publicCode,
    required DateTime guardianConsentAt,
  }) = _ContractGuardianConsentApproveEntity;
}
