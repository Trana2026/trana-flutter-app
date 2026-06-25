import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_attachment_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_pdf_entity.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';
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

    @Default(false) bool isLoading,
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
      isLoading: true,
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
      state = state.copyWith(isLoading: false, error: failure.message);
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
    if (pdfResult case Success(:final data)) {
      final bytesResult = await ref
          .read(contractPdfRepositoryProvider)
          .downloadBytes(data.downloadUrl);
      if (bytesResult case Success(:final data)) {
        pdfBytes = data;
      }
    }

    state = state.copyWith(
      isLoading: false,
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
    );
    return true;
  }

  /// READY > DRAFT 되돌림 (성공 여부 반환)
  Future<bool> revert() async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .revert(state.publicCode);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoading: false,
        status: data.status,
      ),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    if (result is Success) {
      await _refresh(state.publicCode);
    }

    return result is Success;
  }

  Future<void> _refresh(String? publicCode) async {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    await homeVM.readMyContracts();

    if (publicCode == null) return;
    await loadDetail(publicCode);
  }

  void clearError() => state = state.copyWith(error: null);
}
