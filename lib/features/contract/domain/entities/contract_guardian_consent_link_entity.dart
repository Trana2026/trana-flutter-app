import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_guardian_consent_link_entity.freezed.dart';

@freezed
abstract class ContractGuardianConsentLinkEntity
    with _$ContractGuardianConsentLinkEntity {
  const factory ContractGuardianConsentLinkEntity({
    required String token,
    required DateTime expiresAt,
    required String verifyUrl,
  }) = _ContractGuardianConsentLinkEntity;
}
