import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_guardian_consent_approve_dto.freezed.dart';
part 'contract_guardian_consent_approve_dto.g.dart';

@freezed
abstract class ContractGuardianConsentApproveDto
    with _$ContractGuardianConsentApproveDto {
  const factory ContractGuardianConsentApproveDto({
    required String publicCode,
    required DateTime guardianConsentAt,
  }) = _ContractGuardianConsentApproveDto;

  factory ContractGuardianConsentApproveDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ContractGuardianConsentApproveDtoFromJson(json);
}
