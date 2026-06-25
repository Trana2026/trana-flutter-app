import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_draft_dto.dart';
import 'package:trana/features/contract/data/dtos/contract_signed_dto.dart';

class ContractLifecycleDataSource {
  const ContractLifecycleDataSource(this.dio);

  final Dio dio;

  /// POST READY → SHARED 전이 + 카카오톡 알림톡 발송
  Future<ContractDraftDto> share(
    String publicCode, {
    required String receiverName,
    required String receiverPhone,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/share',
      data: {'receiverName': receiverName, 'receiverPhone': receiverPhone},
    );
    return ContractDraftDto.fromJson(response.data!);
  }

  /// POST READY → DRAFT 되돌림
  Future<ContractDraftDto> revert(String publicCode) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/revert',
    );
    return ContractDraftDto.fromJson(response.data!);
  }

  /// POST DRAFT → READY 전이
  Future<ContractDraftDto> ready(String publicCode) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/ready',
    );
    return ContractDraftDto.fromJson(response.data!);
  }

  /// POST RECEIVER_SIGNED → SIGNED 생성자 최종 서명
  Future<ContractSignedDto> creatorSign(
    String publicCode, {
    required String signatureBase64,
    required List<int> agreedTermIds,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/creator-sign',
      data: {
        'signatureBase64': signatureBase64,
        'agreedTermIds': agreedTermIds,
      },
    );
    return ContractSignedDto.fromJson(response.data!);
  }

  /// GET 상태 전이 로그 (WORM audit)
  // Future<void> loadStatusLogs(String publicCode) async {
  //   throw UnimplementedError();
  // }
}
