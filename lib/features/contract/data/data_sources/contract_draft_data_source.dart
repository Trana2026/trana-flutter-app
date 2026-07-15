import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_draft_dto.dart';
import 'package:trana/features/contract/data/dtos/contract_dto.dart';

class ContractDraftDataSource {
  const ContractDraftDataSource(this.dio);

  final Dio dio;

  /// GET 본인 계약 목록
  Future<List<ContractDto>> readMyContracts({
    String? status,
    String? query,
  }) async {
    final response = await dio.get<List<dynamic>>(
      '/v1/contracts',
      queryParameters: {'status': status, 'query': query}
        ..removeWhere((_, value) => value == null),
    );
    return (response.data ?? [])
        .map((e) => ContractDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST 계약 Draft 생성
  Future<ContractDraftDto> createDraft() async {
    final response = await dio.post<Map<String, dynamic>>('/v1/contracts');
    return ContractDraftDto.fromJson(response.data!);
  }

  /// GET 계약 Draft 단건 조회
  Future<ContractDraftDto> readDraft({required String publicCode}) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v1/contracts/$publicCode',
    );
    return ContractDraftDto.fromJson(response.data!);
  }

  /// DELETE 계약 DRAFT soft-delete
  Future<void> deleteDraft(String publicCode) async {
    await dio.delete<void>('/v1/contracts/$publicCode');
  }

  /// PATCH 계약 DRAFT 부분 수정
  Future<ContractDraftDto> updateDraft(
    String publicCode, {
    String? title,
    int? price,
    String? conditionSummary,
    String? conditionDetails,
    String? deliveryType,
    String? creatorRole,
    String? tradingPlatform,
    int? warrantyPeriodDays,
  }) async {
    final response = await dio.patch<Map<String, dynamic>>(
      '/v1/contracts/$publicCode',
      data: {
        'title': title,
        'price': price,
        'conditionSummary': conditionSummary,
        'conditionDetails': conditionDetails,
        'deliveryType': deliveryType,
        'creatorRole': creatorRole,
        'tradingPlatform': tradingPlatform,
        'warrantyPeriodDays': warrantyPeriodDays,
      }..removeWhere((_, value) => value == null),
    );
    return ContractDraftDto.fromJson(response.data!);
  }
}
