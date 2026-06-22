import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/utils/enum_extension.dart';
import 'package:trana/features/contract/domain/enums/age_group.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

part 'create_contract_view_model.freezed.dart';
part 'create_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class CreateContractState with _$CreateContractState {
  const factory CreateContractState({
    ConsentType? consentType, // 사용자의 동의 유형
    String? verifyUrl, // 발급된 보호자 인증 링크
    Role? role, // 선택된 역할
    @Default(DeliveryType.shipping) DeliveryType deliveryType, // 선택된 거래 방식
    String? publicCode, // 생성된 Draft 의 publicCode
    @Default([]) List<AssetEntity> selectedImages, // 등록한 거래 사진 목록
    @Default([])
    List<String> existingAttachmentUrls, // 기존에 등록된 거래 사진 url (수정 모드)
    @Default([]) List<int> attachmentIds, // 업로드된 첨부파일 id 목록
    @Default('') String tradingPlatform, // 입력된 거래 플랫폼
    @Default('') String title, // 입력된 거래 물품명
    @Default(0) int price, // 입력된 거래 금액
    @Default('') String conditionSummary, // 입력된 상품 상태
    @Default('') String conditionDetails, // 입력된 상품 상세 설명
    @Default(0) int warrantyPeriodDays, // 선택된 보증 제공 여부 (0: 미제공, 3: 제공)
    Uint8List? pdfBytes, // 생성된 Pdf 바이트
    @Default(false) bool isLoading,
    String? error,
  }) = _CreateContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class CreateContractViewModel extends _$CreateContractViewModel {
  @override
  CreateContractState build() {
    return const CreateContractState();
  }

  /// 기존 데이터를 상태에 로드 (수정 모드)
  void loadFromDraft({
    required String publicCode,
    required ConsentType? consentType,
    required DeliveryType? deliveryType,
    required Role? role,
    required List<int> attachmentIds,
    required List<String> existingAttachmentUrls,
    required String tradingPlatform,
    required String title,
    required int price,
    required String conditionSummary,
    required String conditionDetails,
    required int warrantyPeriodDays,
  }) {
    state = state.copyWith(
      publicCode: publicCode,
      consentType: consentType,
      deliveryType: deliveryType ?? state.deliveryType,
      role: role,
      attachmentIds: attachmentIds,
      existingAttachmentUrls: existingAttachmentUrls,
      selectedImages: [],
      tradingPlatform: tradingPlatform,
      title: title,
      price: price,
      conditionSummary: conditionSummary,
      conditionDetails: conditionDetails,
      warrantyPeriodDays: warrantyPeriodDays,
    );
  }

  /// Draft 생성 (성공 여부 반환)
  Future<bool> createDraft() async {
    // 새 계약 시작 시 이전 계약 데이터 초기화
    state = CreateContractState(isLoading: true);

    // 현재 로그인 유저의 연령대 조회 (GET /v1/users/me, JWT 자동부착)
    final meResult = await ref.read(userRepositoryProvider).getMe();
    final ageGroupStr = switch (meResult) {
      Success(:final data) => data.ageGroup,
      Failure() => null,
    };
    final userAgeGroup = ageGroupStr == null
        ? null
        : AgeGroup.values.fromApiString(ageGroupStr);

    // 사용자 동의 유형 분류 (성인 = 해당없음, 미성년자 = 보호자 인증 필요)
    switch (userAgeGroup) {
      case null:
        state = state.copyWith(error: '사용자 정보를 가져오는데 실패했습니다');
        return false;
      case AgeGroup.adult:
        state = state.copyWith(consentType: ConsentType.notApplicable);
      case AgeGroup.minor:
        state = state.copyWith(consentType: ConsentType.guardianRequired);
    }

    final result = await ref
        .read(contractDraftRepositoryProvider)
        .createDraft(consentType: state.consentType);

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

    // _refreshHome();

    return result is Success;
  }

  /// 미성년자 보호자 인증 링크 발급 (성공 여부 반환)
  Future<bool> createLink() async {
    if (state.consentType == ConsentType.notApplicable) return false;
    if (state.publicCode == null) {
      state = state.copyWith(error: '계약 초안 정보가 없습니다.');
      return false;
    }

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractGuardianConsentRepositoryProvider)
        .createLink(state.publicCode!);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoading: false,
        verifyUrl: data.verifyUrl,
      ),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  /// 미성년자 계약 생성 보호자 동의 여부 확인
  Future<bool> checkConsentApproved() async {
    if (state.publicCode == null) return false;

    final result = await ref
        .read(contractDraftRepositoryProvider)
        .readDraft(publicCode: state.publicCode!);

    return switch (result) {
      Success(:final data) => data.guardianConsentAt != null,
      Failure() => false,
    };
  }

  /// 역할 선택
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

  /// 거래 방식 선택
  void updateMethod(int index) {
    switch (index) {
      case 0:
        state = state.copyWith(deliveryType: DeliveryType.direct);
      case 1:
        state = state.copyWith(deliveryType: DeliveryType.shipping);
    }
  }

  /// 계약 상세 내용 입력
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

  /// 보증 제공 여부 선택
  void updateWarrantyPeriod(int v) =>
      state = state.copyWith(warrantyPeriodDays: v);

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
          tradingPlatform: state.tradingPlatform.isNotEmpty
              ? state.tradingPlatform
              : null,
          title: state.title.isNotEmpty ? state.title : null,
          price: state.price != 0 ? state.price : null,
          conditionSummary: state.conditionSummary.isNotEmpty
              ? state.conditionSummary
              : null,
          conditionDetails: state.conditionDetails.isNotEmpty
              ? state.conditionDetails
              : null,
          warrantyPeriodDays: state.warrantyPeriodDays,
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

  /// 계약 첨부 사진 등록
  void updateImages(List<AssetEntity> images) {
    state = state.copyWith(selectedImages: images);
  }

  /// 계약 첨부 사진 업로드 (성공 여부 반환)
  Future<bool> updateAttachments() async {
    if (state.publicCode == null) {
      state = state.copyWith(error: '계약 초안 정보가 없습니다.');
      return false;
    }

    state = state.copyWith(isLoading: true);

    final repo = ref.read(contractAttachmentRepositoryProvider);
    final publicCode = state.publicCode!;

    // 1. 기존 첨부파일 삭제
    for (final id in state.attachmentIds) {
      final deleteResult = await repo.deleteAttachment(publicCode, id);
      if (deleteResult case Failure(:final failure)) {
        state = state.copyWith(isLoading: false, error: failure.message);
        return false;
      }
    }
    state = state.copyWith(attachmentIds: []);

    // 2. 새 이미지 업로드 후 id 저장
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

  /// Ready 상태 전이 (성공 여부 반환)
  Future<bool> ready() async {
    if (state.publicCode == null) {
      state = state.copyWith(error: '계약 초안 정보가 없습니다.');
      return false;
    }

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .fromDraftToReady(state.publicCode!);

    state = switch (result) {
      Success() => state.copyWith(isLoading: false),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    if (result is Success) {
      await _refreshHome();
      await _refreshDetail();
    }

    return result is Success;
  }

  Future<void> _refreshHome() {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    return homeVM.readMyContracts();
  }

  Future<void> _refreshDetail() {
    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    return detailVM.refreshDetail();
  }

  void clearError() => state = state.copyWith(error: null);
}
