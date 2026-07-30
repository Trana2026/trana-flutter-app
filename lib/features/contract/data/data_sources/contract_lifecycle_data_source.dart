import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_confirm_completion_dto.dart';
import 'package:trana/features/contract/data/dtos/contract_draft_dto.dart';
import 'package:trana/features/contract/data/dtos/contract_signed_dto.dart';

class ContractLifecycleDataSource {
  const ContractLifecycleDataSource(this.dio);

  final Dio dio;

  /// POST READY → SHARED 전이 + 카카오톡 알림톡 발송
  Future<ContractDraftDto> share(
    String publicCode, {
    required String receiverCode,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/share',
      data: {'receiverCode': receiverCode},
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

  /// POST REVISION_REQUESTED → SHARED 재공유
  Future<ContractDraftDto> reshare(String publicCode) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/reshare',
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

  /// POST SIGNED → COMPLETED 거래 완료 확인 (양측 클릭 모델)
  Future<ContractConfirmCompletionDto> confirmCompletion(
    String publicCode,
  ) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/confirm-completion',
    );
    return ContractConfirmCompletionDto.fromJson(response.data!);
  }

  /// GET 상태 전이 로그 (WORM audit)
  // Future<void> loadStatusLogs(String publicCode) async {
  //   throw UnimplementedError();
  // }
}
