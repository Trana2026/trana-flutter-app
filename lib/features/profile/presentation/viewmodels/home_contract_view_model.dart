import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_entity.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';

part 'home_contract_view_model.freezed.dart';
part 'home_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class HomeContractState with _$HomeContractState {
  const HomeContractState._();

  const factory HomeContractState({
    @Default([]) List<ContractEntity> myContracts, // 사용자의 계약 목록
    ContractStatus? selectedStatus, // 상태 필터 선택값
    @Default(false) bool isLoading,
    String? error,
  }) = _HomeContractState;

  // 배너에 표시할 계약 목록
  List<ContractEntity> get requests => myContracts
      .where(
        (c) =>
            // 서명 요청
            (c.status == ContractStatus.shared && !c.isCreator) ||
            // 수정 요청
            (c.status == ContractStatus.revisionRequested && c.isCreator) ||
            // 최종 서명 요청
            (c.status == ContractStatus.receiverSigned && c.isCreator),
      )
      .toList();
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

    if (isDraftGroup) {
      final results = await Future.wait(
        _draftGroup.map(
          (s) =>
              ref.read(contractRepositoryProvider).readMyContracts(status: s),
        ),
      );

      final contracts = <ContractEntity>[];
      String? error;
      for (final result in results) {
        switch (result) {
          case Success(:final data):
            contracts.addAll(data);
          case Failure(:final failure):
            error = failure.message;
        }
      }

      state = state.copyWith(
        isLoading: false,
        myContracts: contracts,
        error: error,
      );
      return error == null;
    } else {
      final result = await ref
          .read(contractRepositoryProvider)
          .readMyContracts(status: selected);

      switch (result) {
        case Failure(:final failure):
          state = state.copyWith(isLoading: false, error: failure.message);
          return false;
        case Success(:final data):
          state = state.copyWith(isLoading: false, myContracts: data);
          return true;
      }
    }
  }

  /// 상태별 필터 적용
  Future<void> applyStatus(ContractStatus? status) async {
    state = state.copyWith(selectedStatus: status);
    await readMyContracts();
  }

  void clearError() => state = state.copyWith(error: null);
}
