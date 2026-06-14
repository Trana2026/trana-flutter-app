import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_draft_dto.dart';
import 'package:trana/features/contract/data/dtos/contract_receiver_signed_dto.dart';

class ContractInvitationDataSource {
  const ContractInvitationDataSource(this.dio);

  final Dio dio;

  /// POST 수신자 수정 요청 SHARED → REVISION_REQUESTED
  Future<ContractDraftDto> requestRevision(
    String publicCode, {
    String? titleReason,
    String? priceReason,
    String? conditionSummaryReason,
    String? conditionDetailsReason,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/revisions',
      data: {
        'titleReason': titleReason,
        'priceReason': priceReason,
        'conditionSummaryReason': conditionSummaryReason,
        'conditionDetailsReason': conditionDetailsReason,
      }..removeWhere((_, value) => value == null),
    );
    return ContractDraftDto.fromJson(response.data!);
  }

  /// POST 수신자 서명
  Future<ContractReceiverSignedDto> receiverSign(
    String publicCode, {
    required String signatureBase64,
    required List<int> agreedTermIds,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/receiver-sign',
      data: {
        'signatureBase64': signatureBase64,
        'agreedTermIds': agreedTermIds,
      },
    );
    return ContractReceiverSignedDto.fromJson(response.data!);
  }

  /// POST 수신자 invitation 수락 (계약 당사자 연결)
  Future<ContractDraftDto> acceptInvitation(String token) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/invitations/$token/accept',
    );
    return ContractDraftDto.fromJson(response.data!);
  }
}
