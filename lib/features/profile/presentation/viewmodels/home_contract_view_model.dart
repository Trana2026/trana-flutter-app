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
  const HomeContractState._();

  const factory HomeContractState({
    @Default([]) List<ContractEntity> myContracts, // 사용자의 계약 전체 목록
    @Default([]) List<ContractEntity> requestedContracts, // 배너에 표시할 계약 목록
    ContractStatus? selectedStatus, // 상태 필터 선택값
    @Default('') String searchQuery, // 물품명 검색어

    @Default(false) bool isLoadingMyContracts, // 사용자의 계약 전체 목록 로딩중 여부
    String? error,
  }) = _HomeContractState;

  // 미체결 계약 목록 (양측서명/완료/신고/취소 상태 제외)
  List<ContractEntity> get pendingContracts => myContracts
      .where(
        (c) =>
            (c.status != ContractStatus.signed) &&
            (c.status != ContractStatus.completed) &&
            (c.status != ContractStatus.reported) &&
            (c.status != ContractStatus.cancelRequested) &&
            (c.status != ContractStatus.cancelled) &&
            (c.status != ContractStatus.expired),
      )
      .toList();

  // 분쟁 계약 목록 (신고 상태)
  List<ContractEntity> get disputingContracts =>
      myContracts.where((c) => c.status == ContractStatus.reported).toList();
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

  /// 사용자의 계약 전체 목록 불러오기 (성공 여부 반환)
  Future<bool> readMyContracts() async {
    state = state.copyWith(isLoadingMyContracts: true);

    final selected = state.selectedStatus;
    final isDraftGroup = selected != null && _draftGroup.contains(selected);
    final query = state.searchQuery.trim().isEmpty
        ? null
        : state.searchQuery.trim();

    List<ContractEntity> contracts = [];
    String? error;

    if (isDraftGroup) {
      final results = await Future.wait(
        _draftGroup.map((s) {
          return ref
              .read(contractRepositoryProvider)
              .readMyContracts(status: s, query: query);
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
          .readMyContracts(status: selected, query: query);

      switch (result) {
        case Success(:final data):
          contracts = data;
        case Failure(:final failure):
          error = failure.message;
      }
    }

    if (error != null) {
      state = state.copyWith(isLoadingMyContracts: false, error: error);
      return false;
    }

    // 각 계약의 분쟁 상태 (신고) 조회해 반영
    contracts = await _applyDisputeStatuses(contracts);
    // 각 계약의 취소 상태 (본인 요청 여부) 조회해 반영
    contracts = await _applyCancelIsMineFlags(contracts);
    // 배너에 표시될 계약 목록 구분
    final requestedContracts = _computeRequests(contracts);

    state = state.copyWith(
      isLoadingMyContracts: false,
      myContracts: contracts,
      requestedContracts: requestedContracts,
    );
    return true;
  }

  Future<List<ContractEntity>> _applyDisputeStatuses(
    List<ContractEntity> contracts,
  ) async {
    final reportable = contracts
        .where(
          (c) =>
              c.status == ContractStatus.signed ||
              c.status == ContractStatus.completed,
        )
        .toList();

    if (reportable.isEmpty) return contracts;

    final disputeRepo = ref.read(contractDisputeRepositoryProvider);
    final disputeResults = await Future.wait(
      reportable.map((c) => disputeRepo.readDisputes(c.publicCode)),
    );

    final reportIsMineByCode = <String, bool>{};
    for (var i = 0; i < reportable.length; i++) {
      if (disputeResults[i] case Success(:final data)) {
        final reported = data.where((d) => d.status == DisputeState.reported);
        if (reported.isNotEmpty) {
          reportIsMineByCode[reportable[i].publicCode] = reported.first.isMine;
        }
      }
    }

    if (reportIsMineByCode.isEmpty) return contracts;

    return contracts.map((c) {
      return reportIsMineByCode.containsKey(c.publicCode)
          ? c.copyWith(
              status: ContractStatus.reported,
              reportIsMine: reportIsMineByCode[c.publicCode],
            )
          : c;
    }).toList();
  }

  Future<List<ContractEntity>> _applyCancelIsMineFlags(
    List<ContractEntity> contracts,
  ) async {
    final cancelRequested = contracts
        .where((c) => c.status == ContractStatus.cancelRequested)
        .toList();

    if (cancelRequested.isEmpty) return contracts;

    final cancelRepo = ref.read(contractCancellationRepositoryProvider);
    final cancelResults = await Future.wait(
      cancelRequested.map(
        (c) => cancelRepo.readActiveCancellation(c.publicCode),
      ),
    );

    final isMineByCode = <String, bool>{};
    for (var i = 0; i < cancelRequested.length; i++) {
      if (cancelResults[i] case Success(
        :final ContractCancellationEntity? data,
      ) when data != null) {
        isMineByCode[cancelRequested[i].publicCode] = data.isMine;
      }
    }

    if (isMineByCode.isEmpty) return contracts;

    return contracts.map((c) {
      return isMineByCode.containsKey(c.publicCode)
          ? c.copyWith(cancelIsMine: isMineByCode[c.publicCode])
          : c;
    }).toList();
  }

  List<ContractEntity> _computeRequests(List<ContractEntity> contracts) {
    final basic = contracts.where(
      (c) =>
          (c.status == ContractStatus.shared && !c.isCreator) ||
          (c.status == ContractStatus.revisionRequested && c.isCreator) ||
          (c.status == ContractStatus.receiverSigned && c.isCreator),
    );

    final respondable = contracts.where(
      (c) =>
          c.status == ContractStatus.cancelRequested && c.cancelIsMine == false,
    );

    return [...basic, ...respondable];
  }

  /// 상태별 필터 적용
  Future<void> applyStatus(ContractStatus? status) async {
    state = state.copyWith(selectedStatus: status);
    await readMyContracts();
  }

  /// 물품명 검색어 적용
  Future<void> applyQuery(String query) async {
    state = state.copyWith(searchQuery: query);
    await readMyContracts();
  }

  void clearError() => state = state.copyWith(error: null);
}
