import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_guardian_consent_approve_dto.dart';
import 'package:trana/features/contract/data/dtos/contract_guardian_consent_link_dto.dart';

class ContractGuardianConsentDataSource {
  const ContractGuardianConsentDataSource(this.dio);

  final Dio dio;

  /// POST 요청자 보호자 동의 링크 발급 (미성년자)
  Future<ContractGuardianConsentLinkDto> guardianConsent(
    String publicCode,
  ) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/guardian-consent',
    );
    return ContractGuardianConsentLinkDto.fromJson(response.data!);
  }

  /// POST 보호자 동의 확정 (public-web 단순 동의)
  Future<ContractGuardianConsentApproveDto> approve({
    required String token,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/guardian-consent/approve',
      data: {'token': token},
    );
    return ContractGuardianConsentApproveDto.fromJson(response.data!);
  }

  /// POST 수신자 보호자 동의 링크 발급 (미성년자)
  Future<ContractGuardianConsentLinkDto> receiverGuardianConsent(
    String publicCode,
  ) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/receiver-guardian-consent',
    );
    return ContractGuardianConsentLinkDto.fromJson(response.data!);
  }
}
