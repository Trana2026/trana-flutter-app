import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_cancellation_dto.dart';

class ContractCancellationDataSource {
  const ContractCancellationDataSource(this.dio);

  final Dio dio;

  /// POST 취소 요청 접수
  Future<ContractCancellationDto> requestCancellation(
    String publicCode, {
    required String reason,
    required String detail,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/cancellation-requests',
      data: {'reason': reason, 'detail': detail},
    );
    return ContractCancellationDto.fromJson(response.data!);
  }

  /// POST 상대 측 취소 확정 (204)
  Future<void> confirmCancellation(String publicCode) async {
    await dio.post<void>(
      '/v1/contracts/$publicCode/cancellation-requests/confirm',
    );
  }

  /// POST 취소 요청 취소 (204)
  Future<void> revokeCancellation(String publicCode) async {
    await dio.post<void>(
      '/v1/contracts/$publicCode/cancellation-requests/revoke',
    );
  }

  /// GET 활성 취소 요청 조회 (200 = 존재, 204 = 없음)
  Future<ContractCancellationDto?> readActiveCancellation(
    String publicCode,
  ) async {
    final response = await dio.get<Map<String, dynamic>?>(
      '/v1/contracts/$publicCode/cancellation-request',
    );
    if (response.statusCode == 204 || response.data == null) return null;
    return ContractCancellationDto.fromJson(response.data!);
  }
}
