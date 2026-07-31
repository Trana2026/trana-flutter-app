import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/services/share_service.dart';
import 'package:trana/features/contract/domain/entities/contract_attachment_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_pdf_entity.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';
import 'package:trana/features/contract/domain/enums/dispute_state.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/contract/domain/utils/contract_text_builder.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'detail_contract_view_model.freezed.dart';
part 'detail_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class DetailContractState with _$DetailContractState {
  const DetailContractState._();

  const factory DetailContractState({
    // ContractEntity 필드
    Role? myRole,
    @Default(false) bool isCreator,
    @Default(0) int attachmentCount,
    String? firstAttachmentUrl,

    // 공통 계약 정보
    @Default('') String publicCode,
    @Default(ContractStatus.draft) ContractStatus status,
    DeliveryType? deliveryType,
    ConsentType? consentType,
    String? tradingPlatform,
    String? title,
    int? price,
    String? conditionSummary,
    String? conditionDetails,
    @Default(0) int warrantyPeriodDays,
    DateTime? createdAt,
    DateTime? updatedAt,

    // 계약 첨부 사진
    @Default([]) List<int> attachmentIds,
    @Default([]) List<String> attachmentImageUrls,

    // PDF 미리보기
    Uint8List? pdfBytes,
    String? pdfUrl,

    // 위험 신호
    @Default(false) bool hasReportHistory,
    @Default(false) bool trustScoreZero,
    int? counterpartyTrustScore,
    String? counterpartyTrustGrade,
    @Default(false) bool counterpartyIsMinor,
    @Default(false) bool counterpartyVerified,
    @Default(0) int counterpartyTradeCount,
    @Default(0) int counterpartyDisputeCount,
    @Default(0) int counterpartyConfirmedReportCount,

    @Default(false) bool isLoadingData, // 계약 상세 정보 조회 로딩중 여부
    String? error,
  }) = _DetailContractState;

  // PDF 텍스트
  List<({String body, String title})> get contents => buildContractContents(
    title: title ?? '',
    price: price ?? 0,
    deliveryType: deliveryType ?? DeliveryType.shipping,
    tradingPlatform: tradingPlatform ?? '',
    conditionSummary: conditionSummary ?? '',
    conditionDetails: conditionDetails ?? '',
    warrantyPeriodDays: warrantyPeriodDays,
  );

  // 계약 취소 가능 여부 (상대방이 미성년자이거나 분쟁 이력 존재)
  bool get canCancel => counterpartyIsMinor || counterpartyDisputeCount > 0;

  // 사용자가 구매자인지 여부
  bool get isSeller => (myRole != null) && (myRole == Role.seller);
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class DetailContractViewModel extends _$DetailContractViewModel {
  @override
  DetailContractState build() {
    return const DetailContractState();
  }

  /// 선택된 계약 정보 + 첨부 사진 목록 + PDF 불러오기
  Future<bool> loadDetail(String publicCode) async {
    final homeState = ref.read(homeContractViewModelProvider);
    final selectedContract = homeState.myContracts.firstWhere(
      (c) => c.publicCode == publicCode,
    );

    state = state.copyWith(
      isLoadingData: true,
      myRole: selectedContract.myRole,
      isCreator: selectedContract.isCreator,
      attachmentCount: selectedContract.attachmentCount,
      firstAttachmentUrl: selectedContract.firstAttachmentUrl,
      publicCode: selectedContract.publicCode,
      status: selectedContract.status,
      title: selectedContract.title,
      price: selectedContract.price,
      updatedAt: selectedContract.updatedAt,
    );

    final results = await Future.wait([
      ref
          .read(contractDraftRepositoryProvider)
          .readDraft(publicCode: publicCode),
      ref
          .read(contractAttachmentRepositoryProvider)
          .readAttachments(publicCode),
      ref.read(contractPdfRepositoryProvider).pdf(publicCode: publicCode),
    ]);

    final draftResult = results[0] as Result<ContractDraftEntity>;
    final attachmentsResult =
        results[1] as Result<List<ContractAttachmentEntity>>;
    final pdfResult = results[2] as Result<ContractPdfEntity>;

    if (draftResult case Failure(:final failure)) {
      state = state.copyWith(isLoadingData: false, error: failure.message);
      return false;
    }

    final draft = (draftResult as Success<ContractDraftEntity>).data;

    final attachments = switch (attachmentsResult) {
      Success(:final data) => data,
      Failure() => <ContractAttachmentEntity>[],
    };

    final imageUrls = attachments
        .map((a) => a.viewUrl)
        .whereType<String>()
        .toList();

    Uint8List? pdfBytes;
    String? pdfUrl;
    if (pdfResult case Success(:final data)) {
      pdfUrl = data.downloadUrl;
      final bytesResult = await ref
          .read(contractPdfRepositoryProvider)
          .downloadBytes(data.downloadUrl);
      if (bytesResult case Success(:final data)) {
        pdfBytes = data;
      }
    }

    state = state.copyWith(
      isLoadingData: false,
      status: draft.disputeState == DisputeState.reported
          ? ContractStatus.reported
          : draft.status,
      deliveryType: draft.deliveryType,
      consentType: draft.consentType,
      tradingPlatform: draft.tradingPlatform,
      conditionSummary: draft.conditionSummary,
      conditionDetails: draft.conditionDetails,
      warrantyPeriodDays: draft.warrantyPeriodDays,
      createdAt: draft.createdAt,
      updatedAt: draft.updatedAt,
      attachmentIds: attachments.map((a) => a.id).toList(),
      attachmentImageUrls: imageUrls,
      pdfBytes: pdfBytes,
      pdfUrl: pdfUrl,
      hasReportHistory: draft.riskSignals?.hasReportHistory ?? false,
      trustScoreZero: draft.riskSignals?.trustScoreZero ?? false,
      counterpartyTrustScore: draft.riskSignals?.counterpartyTrustScore,
      counterpartyTrustGrade: draft.riskSignals?.counterpartyTrustGrade,
      counterpartyIsMinor: draft.riskSignals?.counterpartyIsMinor ?? false,
      counterpartyVerified: draft.riskSignals?.counterpartyVerified ?? false,
      counterpartyTradeCount: draft.riskSignals?.counterpartyTradeCount ?? 0,
      counterpartyDisputeCount:
          draft.riskSignals?.counterpartyDisputeCount ?? 0,
      counterpartyConfirmedReportCount:
          draft.riskSignals?.counterpartyConfirmedReportCount ?? 0,
    );
    return true;
  }

  /// READY > DRAFT 되돌림 (성공 여부 반환)
  Future<bool> revert() async {
    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .revert(state.publicCode);

    state = switch (result) {
      Success(:final data) => state.copyWith(status: data.status),
      Failure(:final failure) => state.copyWith(error: failure.message),
    };

    return result is Success;
  }

  /// PDF 공유/저장 (성공 여부 반환)
  Future<bool> downloadPdf() async {
    final url = state.pdfUrl;
    if (url == null) {
      state = state.copyWith(error: 'PDF를 불러올 수 없습니다.');
      return false;
    }

    try {
      final filename = 'Trana 물품 거래 계약서 (${state.title}).pdf';
      await ShareService().sharePdf(url, filename: filename);
      return true;
    } catch (_) {
      state = state.copyWith(error: '공유에 실패했습니다.');
      return false;
    }
  }

  void clearError() => state = state.copyWith(error: null);
}
