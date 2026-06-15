import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'delete_contract_view_model.freezed.dart';
part 'delete_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class DeleteContractState with _$DeleteContractState {
  const factory DeleteContractState({
    @Default(false) bool isLoading,
    String? error,
  }) = _DeleteContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class DeleteContractViewModel extends _$DeleteContractViewModel {
  @override
  DeleteContractState build() => const DeleteContractState();

  /// Draft 삭제 (성공 여부 반환)
  Future<bool> deleteDraft(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractDraftRepositoryProvider)
        .deleteDraft(publicCode: publicCode);

    state = switch (result) {
      Success() => state.copyWith(isLoading: false),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    if (result is Success) {
      await _refreshHome();
    }

    return result is Success;
  }

  /// 홈 목록 갱신
  Future<void> _refreshHome() {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    return homeVM.readMyContracts();
  }

  void clearError() => state = state.copyWith(error: null);
}
