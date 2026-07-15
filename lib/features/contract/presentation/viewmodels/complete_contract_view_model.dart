import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'complete_contract_view_model.freezed.dart';
part 'complete_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class CompleteContractState with _$CompleteContractState {
  const factory CompleteContractState({
    String? error,
  }) = _CompleteContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class CompleteContractViewModel extends _$CompleteContractViewModel {
  @override
  CompleteContractState build() => const CompleteContractState();

  /// 거래 완료 (성공 여부 반환)
  Future<bool> complete(String publicCode) async {
    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .confirmCompletion(publicCode);

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

    if (result is Success) {
      await _refresh(publicCode);
    }

    return result is Success;
  }

  Future<void> _refresh(String? publicCode) async {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    await homeVM.readMyContracts();

    if (publicCode == null) return;

    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    await detailVM.loadDetail(publicCode);
  }

  void clearError() => state = state.copyWith(error: null);
}
