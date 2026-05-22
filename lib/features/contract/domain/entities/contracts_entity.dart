import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/transaction_method.dart';

part 'contracts_entity.freezed.dart';

/// 계약
@freezed
abstract class ContractsEntity with _$ContractsEntity {
  const factory ContractsEntity({
    int? id,
    required int senderUserId, // 요청자 사용자 ID
    int? recipientUserId, // 수신자 사용자 ID
    required ContractStatus status, // 거래 상태
    required String productName, // 상품명
    required int amount, // 거래 금액
    required String conditionSummary, // 상품 상태
    required String conditionDetails, // 상품 상세 설명
    required TransactionMethod transactionMethod, // 거래 방식
    required bool warranted, // 보증 제공 여부 (기본 3일)
    required String pdfS3Key, // S3 PDF 경로
    DateTime? signedAt, // 양측 서명 일시
    DateTime? completedAt, // 거래 완료 일시
    required DateTime createdAt,

    // required String publicCode, // 공개 계약 ID
    // String? invitationTokenHash, // 초대토큰해시
    // DateTime? invitationExpiresAt, // 초대만료일시
    // required String disclosureText, // 고지사항
    // String? finalHash, // 최종 PDF 해시
    // required int version, // 버전
    // DateTime? deletedAt, // 삭제 일시
  }) = _ContractsEntity;
}
