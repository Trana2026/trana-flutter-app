import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

part 'modify_contract_view_model.freezed.dart';
part 'modify_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class ModifyContractState with _$ModifyContractState {
  const factory ModifyContractState({
    String? publicCode,
    ConsentType? consentType,
    @Default(DeliveryType.shipping) DeliveryType deliveryType,
    Role? role,
    @Default([]) List<int> attachmentIds,
    @Default([]) List<String> existingAttachmentUrls,
    @Default([]) List<AssetEntity> selectedImages,
    @Default('') String tradingPlatform,
    @Default('') String title,
    @Default(0) int price,
    @Default('') String conditionSummary,
    @Default('') String conditionDetails,
    @Default(false) bool warranted,
    Uint8List? pdfBytes,
    @Default(false) bool isLoading,
    String? error,
  }) = _ModifyContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class ModifyContractViewModel extends _$ModifyContractViewModel {
  @override
  ModifyContractState build() {
    return const ModifyContractState();
  }

  /// 기존 데이터를 상태에 로드
  void loadFromDraft({
    required String publicCode,
    required ConsentType? consentType,
    required DeliveryType? deliveryType,
    required Role? role,
    required List<int> attachmentIds,
    required List<String> existingAttachmentUrls,
    required String title,
    required int price,
    required String conditionSummary,
    required String conditionDetails,
    required bool warranted,
  }) {
    state = state.copyWith(
      publicCode: publicCode,
      consentType: consentType,
      deliveryType: deliveryType ?? state.deliveryType,
      role: role,
      attachmentIds: attachmentIds,
      existingAttachmentUrls: existingAttachmentUrls,
      selectedImages: [],
      title: title,
      price: price,
      conditionSummary: conditionSummary,
      conditionDetails: conditionDetails,
      warranted: warranted,
    );
  }

  void updateImages(List<AssetEntity> images) {
    state = state.copyWith(selectedImages: images);
  }

  void updateWarranted(bool v) => state = state.copyWith(warranted: v);

  void updateRole(int? index) {
    switch (index) {
      case null:
        state = state.copyWith(role: null);
      case 0:
        state = state.copyWith(role: Role.seller);
      case 1:
        state = state.copyWith(role: Role.buyer);
    }
  }

  void updateMethod(int index) {
    switch (index) {
      case 0:
        state = state.copyWith(deliveryType: DeliveryType.direct);
      case 1:
        state = state.copyWith(deliveryType: DeliveryType.shipping);
    }
  }

  void updateEntries({
    required String platformText,
    required String nameText,
    required String priceText,
    required String conditionText,
    required String detailText,
  }) {
    state = state.copyWith(
      tradingPlatform: platformText,
      title: nameText,
      price: int.tryParse(priceText.replaceAll(',', '')) ?? 0,
      conditionSummary: conditionText,
      conditionDetails: detailText,
    );
  }

  /// Draft 역할 업데이트 (성공 여부 반환)
  Future<bool> updateDraftRole() async {
    if (state.publicCode == null) {
      state = state.copyWith(error: '계약 초안 정보가 없습니다.');
      return false;
    }

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractDraftRepositoryProvider)
        .updateDraft(publicCode: state.publicCode!, creatorRole: state.role);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoading: false,
        publicCode: data.publicCode,
      ),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    _refreshHome();

    return result is Success;
  }

  /// Draft 항목 업데이트 (성공 여부 반환)
  Future<bool> updateDraftEntries() async {
    if (state.publicCode == null) {
      state = state.copyWith(error: '계약 초안 정보가 없습니다.');
      return false;
    }

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractDraftRepositoryProvider)
        .updateDraft(
          publicCode: state.publicCode!,
          deliveryType: state.deliveryType,
          title: state.title.isNotEmpty ? state.title : null,
          price: state.price != 0 ? state.price : null,
          conditionSummary: state.conditionSummary.isNotEmpty
              ? state.conditionSummary
              : null,
          conditionDetails: state.conditionDetails.isNotEmpty
              ? state.conditionDetails
              : null,
        );

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoading: false,
        publicCode: data.publicCode,
      ),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    _refreshHome();

    return result is Success;
  }

  /// 계약 첨부 사진 업로드  (성공 여부 반환)
  Future<bool> updateAttachments() async {
    if (state.publicCode == null) {
      state = state.copyWith(error: '계약 초안 정보가 없습니다.');
      return false;
    }

    state = state.copyWith(isLoading: true);

    final repo = ref.read(contractAttachmentRepositoryProvider);
    final publicCode = state.publicCode!;

    for (final id in state.attachmentIds) {
      final deleteResult = await repo.deleteAttachment(publicCode, id);
      if (deleteResult case Failure(:final failure)) {
        state = state.copyWith(isLoading: false, error: failure.message);
        return false;
      }
    }
    state = state.copyWith(attachmentIds: [], existingAttachmentUrls: []);

    final uploadedIds = <int>[];
    for (final asset in state.selectedImages) {
      final file = await asset.file;
      if (file == null) continue;

      final bytes = await file.readAsBytes();
      final filename = file.path.split('/').last;
      final contentType = _mimeType(filename);

      final result = await repo.uploadAttachment(
        publicCode: publicCode,
        bytes: bytes,
        filename: filename,
        contentType: contentType,
      );

      switch (result) {
        case Success(:final data):
          uploadedIds.add(data.id);
        case Failure(:final failure):
          state = state.copyWith(isLoading: false, error: failure.message);
          return false;
      }
    }

    state = state.copyWith(isLoading: false, attachmentIds: uploadedIds);
    return true;
  }

  /// PDF 생성 (성공 여부 반환)
  Future<bool> readPdfPreview() async {
    if (state.publicCode == null) {
      state = state.copyWith(error: '계약 초안 정보가 없습니다.');
      return false;
    }

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractPdfRepositoryProvider)
        .preview(publicCode: state.publicCode!);

    state = switch (result) {
      Success(:final data) => state.copyWith(isLoading: false, pdfBytes: data),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  String _mimeType(String filename) {
    final ext = filename.split('.').last.toLowerCase();
    return switch (ext) {
      'png' => 'image/png',
      'gif' => 'image/gif',
      'webp' => 'image/webp',
      'heic' || 'heif' => 'image/heic',
      _ => 'image/jpeg',
    };
  }

  Future<void> _refreshHome() {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    return homeVM.readMyContracts();
  }

  void clearError() => state = state.copyWith(error: null);
}
