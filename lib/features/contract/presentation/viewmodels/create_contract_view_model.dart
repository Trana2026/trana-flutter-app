import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_parties_entity.dart';
import 'package:trana/features/contract/domain/entities/contracts_entity.dart';
import 'package:trana/features/contract/domain/entities/pdf_entity.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/party_type.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/contract/domain/enums/transaction_method.dart';
import 'package:trana/features/profile/presentation/providers/current_user_provider.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

part 'create_contract_view_model.freezed.dart';
part 'create_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class CreateContractState with _$CreateContractState {
  const factory CreateContractState({
    Role? role, // 선택된 역할
    @Default(TransactionMethod.delivery) TransactionMethod method, // 선택된 거래 방식
    @Default([]) List<AssetEntity> selectedImages, // 등록한 거래 사진 목록
    @Default('') String name, // 입력된 거래 물품명
    @Default(0) int amount, // 입력된 거래 금액
    @Default('') String condition, // 입력된 상품 상태
    @Default('') String details, // 입력된 상품 상세 설명
    @Default(false) bool warranted, // 선택된 보증 제공 여부
    Uint8List? pdfBytes, // 생성된 Pdf 바이트
    int? contractId, // 생성된 계약서 초안 id
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

  /// 거래 방식 선택
  void updateMethod(int index) {
    switch (index) {
      case 0:
        state = state.copyWith(method: TransactionMethod.direct);
      case 1:
        state = state.copyWith(method: TransactionMethod.delivery);
    }
  }

  /// 거래 사진 등록
  void updateImages(List<AssetEntity> images) {
    state = state.copyWith(selectedImages: images);
  }

  /// 계약서 항목 입력
  void updateEntries({
    required String nameText,
    required String priceText,
    required String conditionText,
    required String detailText,
  }) {
    state = state.copyWith(
      name: nameText,
      amount: int.tryParse(priceText.replaceAll(',', '')) ?? 0,
      condition: conditionText,
      details: detailText,
    );
  }

  /// 보증 제공 여부 선택
  void updateWarranted(bool v) => state = state.copyWith(warranted: v);

  /// PDF 생성
  Future<void> generatePdf() async {
    state = state.copyWith(isLoading: true);
    final entries = PdfEntity(
      productName: state.name,
      amount: state.amount,
      transactionMethod: state.method,
    );
    final result = await ref.read(pdfRepositoryProvider).generatePdf(entries);
    state = switch (result) {
      Success(:final data) => state.copyWith(isLoading: false, pdfBytes: data),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };
  }

  /// 계약서 초안 생성
  Future<void> createDraft() async {
    final now = DateTime.now();
    final userId = ref.read(currentUserProvider);

    // 1. PDF S3 업로드
    final saveResult = await ref
        .read(pdfRepositoryProvider)
        .savePdf(state.pdfBytes!);
    final String pdfS3Key;
    switch (saveResult) {
      case Failure(:final failure):
        state = state.copyWith(error: failure.message);
        return;
      case Success(:final data):
        pdfS3Key = data;
    }

    // 2. 계약 생성
    final contract = ContractsEntity(
      senderUserId: userId,
      transactionMethod: state.method,
      productName: state.name,
      amount: state.amount,
      conditionSummary: state.condition,
      conditionDetails: state.details,
      pdfS3Key: pdfS3Key,
      status: ContractStatus.draft,
      warranted: state.warranted,
      createdAt: now,
    );
    final contractResult = await ref
        .read(contractsRepositoryProvider)
        .createContract(contract);
    final int contractId;
    switch (contractResult) {
      case Failure(:final failure):
        state = state.copyWith(error: failure.message);
        return;
      case Success(:final data):
        contractId = data;
        state = state.copyWith(contractId: contractId);
    }

    // 3. 계약 당사자 생성 (요청자)
    final party = ContractPartiesEntity(
      contractId: contractId,
      userId: userId,
      role: state.role!,
      partyType: PartyType.sender,
      validated: true, // TODO : 해당 거래 내 사용자 인증 여부 가져오기
      createdAt: now,
    );
    final partyResult = await ref
        .read(contractPartiesRepositoryProvider)
        .createContractParty(party);
    if (partyResult case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
      return;
    }

    // 4. 거래 사진 업로드
    if (state.selectedImages.isNotEmpty) {
      final bytesList = await Future.wait(
        state.selectedImages.map((asset) async {
          final file = await asset.file;
          return file?.readAsBytes();
        }),
      );
      final validBytes = bytesList.whereType<Uint8List>().toList();
      if (validBytes.isNotEmpty) {
        final photosResult = await ref
            .read(productPhotosRepositoryProvider)
            .createProductPhotos(contractId, validBytes);
        if (photosResult case Failure(:final failure)) {
          state = state.copyWith(error: failure.message);
          return;
        }
      }
    }

    // 목록 갱신
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    await homeVM.readContractSummaries();
  }

  void clearError() => state = state.copyWith(error: null);
}
