import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_dispute_dto.dart';

class ContractDisputeDataSource {
  const ContractDisputeDataSource(this.dio);

  final Dio dio;

  /// GET 계약 단위 신고 목록 (양측 조회)
  Future<ContractDisputeListDto> readDisputes(String publicCode) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/disputes',
    );
    return ContractDisputeListDto.fromJson(response.data!);
  }

  /// POST 신고 접수
  Future<ContractDisputeDto> reportDispute(
    String publicCode, {
    required String reason,
    required String detail,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/disputes',
      data: {'reason': reason, 'detail': detail},
    );
    return ContractDisputeDto.fromJson(response.data!);
  }

  /// GET 증거 패키지 다운로드 (zip)
  Future<Uint8List> downloadEvidencePackage(String publicCode) async {
    final response = await dio.get<List<int>>(
      '/v1/contracts/$publicCode/evidence-package',
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(response.data!);
  }

  /// DELETE 신고자 본인 취소
  Future<void> cancelDispute(String publicCode, int disputeId) async {
    await dio.delete<void>(
      '/v1/contracts/$publicCode/disputes/$disputeId',
    );
  }
}
