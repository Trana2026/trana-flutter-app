import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_draft_dto.dart';
import 'package:trana/features/contract/data/dtos/contract_receiver_signed_dto.dart';
import 'package:trana/features/contract/data/dtos/contract_revision_reason_dto.dart';

class ContractInvitationDataSource {
  const ContractInvitationDataSource(this.dio);

  final Dio dio;

  /// POST 수신자 수정 요청 SHARED → REVISION_REQUESTED
  Future<ContractDraftDto> revisions(
    String publicCode, {
    String? deliveryTypeReason,
    String? tradingPlatformReason,
    String? titleReason,
    String? priceReason,
    String? conditionSummaryReason,
    String? conditionDetailsReason,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/revisions',
      data: {
        'deliveryTypeReason': deliveryTypeReason,
        'tradingPlatformReason': tradingPlatformReason,
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

  /// PATCH 수신자(SELLER) 보증기간 변경
  Future<ContractDraftDto> receiverWarranty(
    String publicCode, {
    required int warrantyPeriodDays,
  }) async {
    final response = await dio.patch<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/receiver-warranty',
      data: {'warrantyPeriodDays': warrantyPeriodDays},
    );
    return ContractDraftDto.fromJson(response.data!);
  }

  /// GET 가장 최근 수정 요청 1건 조회
  Future<ContractRevisionReasonDto> latest(String publicCode) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/revisions/latest',
    );
    return ContractRevisionReasonDto.fromJson(response.data!);
  }
}
