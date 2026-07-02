import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_cancellation_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_entity.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/dispute_state.dart';

part 'home_contract_view_model.freezed.dart';
part 'home_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class HomeContractState with _$HomeContractState {
  const factory HomeContractState({
    @Default([]) List<ContractEntity> myContracts,
    @Default([]) List<ContractEntity> requests, // 배너에 표시할 계약 목록
    ContractStatus? selectedStatus,
    @Default(false) bool isLoading,
    String? error,
  }) = _HomeContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class HomeContractViewModel extends _$HomeContractViewModel {
  static const _draftGroup = [
    ContractStatus.inProgress,
    ContractStatus.draft,
    ContractStatus.ready,
  ];

  @override
  HomeContractState build() => const HomeContractState();

  /// 현재 사용자의 계약 목록 불러오기 (성공 여부 반환)
  Future<bool> readMyContracts() async {
    state = state.copyWith(isLoading: true);

    final selected = state.selectedStatus;
    final isDraftGroup = selected != null && _draftGroup.contains(selected);

    List<ContractEntity> contracts = [];
    String? error;

    if (isDraftGroup) {
      final results = await Future.wait(
        _draftGroup.map((s) {
          return ref
              .read(contractRepositoryProvider)
              .readMyContracts(status: s);
        }),
      );

      for (final result in results) {
        switch (result) {
          case Success(:final data):
            contracts.addAll(data);
          case Failure(:final failure):
            error = failure.message;
        }
      }
    } else {
      final result = await ref
          .read(contractRepositoryProvider)
          .readMyContracts(status: selected);

      switch (result) {
        case Success(:final data):
          contracts = data;
        case Failure(:final failure):
          error = failure.message;
      }
    }

    if (error != null) {
      state = state.copyWith(isLoading: false, error: error);
      return false;
    }

    contracts = await _applyDisputeStatuses(contracts);
    final requests = await _computeRequests(contracts);

    state = state.copyWith(
      isLoading: false,
      myContracts: contracts,
      requests: requests,
    );
    return true;
  }

  Future<List<ContractEntity>> _applyDisputeStatuses(
    List<ContractEntity> contracts,
  ) async {
    final signed = contracts
        .where((c) => c.status == ContractStatus.signed)
        .toList();

    if (signed.isEmpty) return contracts;

    final disputeRepo = ref.read(contractDisputeRepositoryProvider);
    final disputeResults = await Future.wait(
      signed.map((c) => disputeRepo.readDisputes(c.publicCode)),
    );

    final reportedCodes = <String>{};
    for (var i = 0; i < signed.length; i++) {
      if (disputeResults[i] case Success(:final data)) {
        if (data.any((d) => d.status == DisputeState.reported)) {
          reportedCodes.add(signed[i].publicCode);
        }
      }
    }

    if (reportedCodes.isEmpty) return contracts;

    return contracts.map((c) {
      return reportedCodes.contains(c.publicCode)
          ? c.copyWith(status: ContractStatus.reported)
          : c;
    }).toList();
  }

  Future<List<ContractEntity>> _computeRequests(
    List<ContractEntity> contracts,
  ) async {
    final basic = contracts.where(
      (c) =>
          (c.status == ContractStatus.shared && !c.isCreator) ||
          (c.status == ContractStatus.revisionRequested && c.isCreator) ||
          (c.status == ContractStatus.receiverSigned && c.isCreator),
    );

    final cancelRequested = contracts
        .where((c) => c.status == ContractStatus.cancelRequested)
        .toList();

    if (cancelRequested.isEmpty) return basic.toList();

    // cancelRequested 계약마다 취소 상태 병렬 조회
    final cancelRepo = ref.read(contractCancellationRepositoryProvider);
    final cancelResults = await Future.wait(
      cancelRequested.map(
        (c) => cancelRepo.readActiveCancellation(c.publicCode),
      ),
    );

    // isMine == false 인 계약 배너 목록에 추가
    final respondable = <ContractEntity>[];
    for (var i = 0; i < cancelRequested.length; i++) {
      if (cancelResults[i] case Success(
        :final ContractCancellationEntity? data,
      ) when data?.isMine == false) {
        respondable.add(cancelRequested[i]);
      }
    }

    return [...basic, ...respondable];
  }

  /// 상태별 필터 적용
  Future<void> applyStatus(ContractStatus? status) async {
    state = state.copyWith(selectedStatus: status);
    await readMyContracts();
  }

  void clearError() => state = state.copyWith(error: null);
}
