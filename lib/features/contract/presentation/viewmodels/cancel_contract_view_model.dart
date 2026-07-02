import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_cancellation_entity.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'cancel_contract_view_model.freezed.dart';
part 'cancel_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class CancelContractState with _$CancelContractState {
  const factory CancelContractState({
    @Default('') String reason, // 취소 사유
    @Default('') String detail, // 상세 내용

    ContractCancellationEntity? recentCancel, // 최근 취소 내역

    @Default(false) bool isLoading,
    String? error,
  }) = _CancelContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class CancelContractViewModel extends _$CancelContractViewModel {
  @override
  CancelContractState build() => const CancelContractState();

  void updateInput({required String reason, required String detail}) =>
      state = state.copyWith(reason: reason, detail: detail);

  /// 취소 요청 접수 (성공 여부 반환)
  Future<bool> requestCancel(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractCancellationRepositoryProvider)
        .requestCancellation(
          publicCode: publicCode,
          reason: state.reason,
          detail: state.detail,
        );

    state = switch (result) {
      Success() => state.copyWith(isLoading: false),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    if (result is Success) {
      await _refresh(publicCode);
    }

    return result is Success;
  }

  /// 취소 요청 내용 조회 (성공 여부 반환)
  Future<bool> readCancel(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractCancellationRepositoryProvider)
        .readActiveCancellation(publicCode);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoading: false,
        recentCancel: data,
      ),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  /// 취소 확정 (성공 여부 반환)
  Future<bool> confirmCancel(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractCancellationRepositoryProvider)
        .confirmCancellation(publicCode);

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

  Future<void> _refreshHome() async {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    await homeVM.readMyContracts();
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
