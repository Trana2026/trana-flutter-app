import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_guardian_consent_link_dto.freezed.dart';
part 'contract_guardian_consent_link_dto.g.dart';

@freezed
abstract class ContractGuardianConsentLinkDto
    with _$ContractGuardianConsentLinkDto {
  const factory ContractGuardianConsentLinkDto({
    required String token,
    required DateTime expiresAt,
    required String verifyUrl,
  }) = _ContractGuardianConsentLinkDto;

  factory ContractGuardianConsentLinkDto.fromJson(Map<String, dynamic> json) =>
      _$ContractGuardianConsentLinkDtoFromJson(json);
}
