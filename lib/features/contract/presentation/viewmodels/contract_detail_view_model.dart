import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_parties_entity.dart';
import 'package:trana/features/contract/domain/entities/contracts_entity.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/party_type.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/profile/presentation/providers/current_user_provider.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'contract_detail_view_model.freezed.dart';
part 'contract_detail_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class ContractDetailState with _$ContractDetailState {
  const factory ContractDetailState({
    ContractsEntity? selectedContract, // 현재 선택된 계약 정보
    ContractPartiesEntity? myParty, // 사용자의 계약 당사자 정보
    @Default(false) bool isLoading,
    String? error,
  }) = _ContractDetailState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class ContractDetailViewModel extends _$ContractDetailViewModel {
  @override
  ContractDetailState build() {
    return const ContractDetailState();
  }

  /// 현재 선택된 계약 + 사용자의 계약 당사자 정보 불러오기
  Future<void> readSelectedContract(int contractId) async {
    state = state.copyWith(isLoading: true);

    final contractResult = await ref
        .read(contractsRepositoryProvider)
        .readContract(contractId);
    final ContractsEntity contract;
    switch (contractResult) {
      case Failure(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
        return;
      case Success(:final data):
        contract = data;
    }

    final userId = ref.read(currentUserProvider);
    final partiesResult = await ref
        .read(contractPartiesRepositoryProvider)
        .readContractParties(contractId);
    final myParty = switch (partiesResult) {
      Success(:final data) => data.where((p) => p.userId == userId).firstOrNull,
      Failure() => null,
    };

    state = state.copyWith(
      isLoading: false,
      selectedContract: contract,
      myParty: myParty,
    );
  }

  /// 서명 요청
  Future<void> requestSign() async {
    if (state.selectedContract == null || state.myParty == null) return;

    state = state.copyWith(isLoading: true);

    final updatedParty = state.myParty!.copyWith(signedAt: DateTime.now());
    await ref
        .read(contractPartiesRepositoryProvider)
        .updateContractParty(updatedParty);

    await _applyContractUpdate(
      state.selectedContract!.copyWith(status: ContractStatus.signRequested),
    );
  }

  /// 수신자 서명 완료
  Future<void> sign() async {
    if (state.selectedContract == null) return;

    state = state.copyWith(isLoading: true);
    final now = DateTime.now();
    final userId = ref.read(currentUserProvider);
    final contractId = state.selectedContract!.id!;

    // 계약 당사자 (수신자) 생성
    final partiesResult = await ref
        .read(contractPartiesRepositoryProvider)
        .readContractParties(contractId);
    final senderRole = switch (partiesResult) {
      Success(:final data) =>
        data.where((p) => p.partyType == PartyType.sender).firstOrNull?.role,
      Failure() => null,
    };
    final recipientRole = senderRole == Role.seller ? Role.buyer : Role.seller;
    final recipient = ContractPartiesEntity(
      contractId: contractId,
      userId: userId,
      role: recipientRole,
      partyType: PartyType.recipient,
      validated: true,
      createdAt: now,
      signedAt: now,
    );
    await ref
        .read(contractPartiesRepositoryProvider)
        .createContractParty(recipient);
    state = state.copyWith(myParty: recipient);

    await _applyContractUpdate(
      state.selectedContract!.copyWith(
        recipientUserId: userId,
        status: ContractStatus.signed,
        signedAt: now,
      ),
    );
  }

  /// 거래 완료 확정
  Future<void> complete() async {
    if (state.selectedContract == null) return;

    state = state.copyWith(isLoading: true);
    await _applyContractUpdate(
      state.selectedContract!.copyWith(
        status: ContractStatus.completed,
        completedAt: DateTime.now(),
      ),
    );
  }

  /// 신고
  Future<void> reportt() async {
    if (state.selectedContract == null) return;

    state = state.copyWith(isLoading: true);
    await _applyContractUpdate(
      state.selectedContract!.copyWith(status: ContractStatus.reported),
    );
  }

  /// 계약 삭제
  Future<void> deleteContract() async {
    if (state.selectedContract == null) return;

    state = state.copyWith(isLoading: true);
    final result = await ref
        .read(contractsRepositoryProvider)
        .deleteContract(state.selectedContract!.id!);

    switch (result) {
      case Success():
        state = state.copyWith(isLoading: false, selectedContract: null);
        await _refreshHome();
      case Failure(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
    }
  }

  /// updateContract 후 state 반영
  Future<void> _applyContractUpdate(ContractsEntity updated) async {
    final result = await ref
        .read(contractsRepositoryProvider)
        .updateContract(updated);

    switch (result) {
      case Success():
        state = state.copyWith(isLoading: false, selectedContract: updated);
        await _refreshHome();
      case Failure(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
    }
  }

  /// 홈 목록 갱신
  Future<void> _refreshHome() {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    return homeVM.readContractSummaries();
  }

  void clearError() => state = state.copyWith(error: null);
}
