import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contracts_entity.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/profile/presentation/providers/current_user_provider.dart';

part 'home_contract_view_model.freezed.dart';
part 'home_contract_view_model.g.dart';

// ==================== Model ====================

class ContractSummary {
  const ContractSummary({required this.contract, required this.myRole});

  final ContractsEntity contract;
  final Role myRole;
}

// ==================== State ====================

@freezed
abstract class HomeContractState with _$HomeContractState {
  const factory HomeContractState({
    @Default([]) List<ContractSummary> recentContracts, // 최근 계약 정보 + 사용자의 역할 목록
    @Default(false) bool isLoading,
    String? error,
  }) = _HomeContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class HomeContractViewModel extends _$HomeContractViewModel {
  @override
  HomeContractState build() => const HomeContractState();

  /// 최근 계약 정보 + 사용자의 역할 목록 불러오기
  Future<void> readContractSummaries() async {
    state = state.copyWith(isLoading: true, error: null);
    final userId = ref.read(currentUserProvider);

    final contractsResult = await ref
        .read(contractsRepositoryProvider)
        .readRecentContracts(userId, 30);

    final List<ContractsEntity> contracts;
    switch (contractsResult) {
      case Failure(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
        return;
      case Success(:final data):
        contracts = data;
    }

    final summaries = await Future.wait(
      contracts.map((contract) async {
        final partiesResult = await ref
            .read(contractPartiesRepositoryProvider)
            .readContractParties(contract.id!);
        final myRole = switch (partiesResult) {
          Success(:final data) =>
            data.where((p) => p.userId == userId).firstOrNull?.role ??
                Role.seller,
          Failure() => Role.seller,
        };
        return ContractSummary(contract: contract, myRole: myRole);
      }),
    );

    state = state.copyWith(isLoading: false, recentContracts: summaries);
  }

  void clearError() => state = state.copyWith(error: null);
}
