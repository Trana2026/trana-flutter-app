import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_minor_disclosure_confirm_dto.dart';
import 'package:trana/features/contract/data/dtos/contract_minor_disclosure_dto.dart';

class ContractMinorDisclosureDataSource {
  const ContractMinorDisclosureDataSource(this.dio);

  final Dio dio;

  /// GET 위험 고지 문구 조회
  Future<ContractMinorDisclosureDto> readLatest() async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v1/contracts/minor-disclosure/latest',
    );
    return ContractMinorDisclosureDto.fromJson(response.data!);
  }

  /// POST 위험 고지 확인 (성인 > 미성년 상대)
  Future<ContractMinorDisclosureConfirmDto> confirm({
    required String publicCode,
    required DateTime disclosedAt,
    required String templateVersion,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/minor-disclosure/confirm',
      data: {
        'disclosedAt': disclosedAt.toUtc().toIso8601String(),
        'templateVersion': templateVersion,
      },
    );
    return ContractMinorDisclosureConfirmDto.fromJson(response.data!);
  }
}
