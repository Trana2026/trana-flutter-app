import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_attachment_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_entity.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'detail_contract_view_model.freezed.dart';
part 'detail_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class DetailContractState with _$DetailContractState {
  const factory DetailContractState({
    // ContractEntity 필드
    Role? myRole,
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

    @Default(false) bool isLoading,
    String? error,
  }) = _DetailContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class DetailContractViewModel extends _$DetailContractViewModel {
  @override
  DetailContractState build() {
    return const DetailContractState();
  }

  /// 선택된 계약 정보 + 첨부 사진 목록 불러오기
  Future<bool> loadContract(ContractEntity contract) async {
    state = state.copyWith(
      isLoading: true,
      publicCode: contract.publicCode,
      status: contract.status,
      title: contract.title,
      price: contract.price,
      myRole: contract.myRole,
      attachmentCount: contract.attachmentCount,
      firstAttachmentUrl: contract.firstAttachmentUrl,
      updatedAt: contract.updatedAt,
    );

    final results = await Future.wait([
      ref
          .read(contractDraftRepositoryProvider)
          .readDraft(publicCode: contract.publicCode),
      ref
          .read(contractAttachmentRepositoryProvider)
          .readAttachments(contract.publicCode),
    ]);

    final draftResult = results[0] as Result<ContractDraftEntity>;
    final attachmentsResult =
        results[1] as Result<List<ContractAttachmentEntity>>;

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
    );
    return true;
  }

  /// READY > DRAFT 되돌림 (성공 여부 반환)
  Future<bool> revert() async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .fromReadyToDraft(state.publicCode);

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

    return result is Success;
  }

  /// 계약 상세 정보 갱신
  Future<void> refreshDetail() async {
    if (state.publicCode.isEmpty) return;

    final updated = ref
        .read(homeContractViewModelProvider)
        .myContracts
        .where((c) => c.publicCode == state.publicCode)
        .firstOrNull;
    if (updated == null) return;

    await loadContract(updated);
  }

  void clearError() => state = state.copyWith(error: null);
}
