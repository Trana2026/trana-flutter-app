import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_cancellation_entity.dart';
import 'package:trana/features/contract/domain/enums/cancellation_reason.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'cancel_contract_view_model.freezed.dart';
part 'cancel_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class CancelContractState with _$CancelContractState {
  const factory CancelContractState({
    @Default(CancellationReason.reportHistory)
    CancellationReason reason, // 취소 사유
    @Default('') String detail, // 상세 내용

    String? recentCancelReason, // 최근 취소 사유
    String? recentCancelDetail, // 최근 취소 상세 내용
    @Default(false) bool recentCancelIsMine, // 최근 취소가 본인 요청인지 여부

    String? error,
  }) = _CancelContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class CancelContractViewModel extends _$CancelContractViewModel {
  @override
  CancelContractState build() => const CancelContractState();

  // 최소 사유 선택
  void updateReason(CancellationReason v) => state = state.copyWith(reason: v);

  // 상세 내용 입력
  void updateDetail(String v) => state = state.copyWith(detail: v);

  /// 취소 요청 내용 조회 (성공 여부 반환)
  Future<bool> readCancel(String publicCode) async {
    final result = await ref
        .read(contractCancellationRepositoryProvider)
        .readActiveCancellation(publicCode);

    state = switch (result) {
      Success(:final data) => _applyRecentCancel(data),
      Failure(:final failure) => state.copyWith(error: failure.message),
    };

    return result is Success;
  }

  CancelContractState _applyRecentCancel(ContractCancellationEntity? recent) =>
      state.copyWith(
        recentCancelReason: recent?.reason,
        recentCancelDetail: recent?.detail,
        recentCancelIsMine: recent?.isMine ?? false,
      );

  /// 취소 요청 접수 (성공 여부 반환)
  Future<bool> requestCancel(String publicCode) async {
    final result = await ref
        .read(contractCancellationRepositoryProvider)
        .requestCancellation(
          publicCode: publicCode,
          reason: state.reason.label,
          detail: state.detail,
        );

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

    if (result is Success) {
      await _refresh(publicCode);
      await readCancel(publicCode);
    }

    return result is Success;
  }

  /// 취소 확정 (성공 여부 반환)
  Future<bool> confirmCancel(String publicCode) async {
    final result = await ref
        .read(contractCancellationRepositoryProvider)
        .confirmCancellation(publicCode);

    state = switch (result) {
      Success() => _applyRecentCancel(null),
      Failure(:final failure) => state.copyWith(error: failure.message),
    };

    if (result is Success) {
      await _refreshHome();
    }

    return result is Success;
  }

  /// 취소 요청 취소 (성공 여부 반환)
  Future<bool> revokeCancel(String publicCode) async {
    final result = await ref
        .read(contractCancellationRepositoryProvider)
        .revokeCancellation(publicCode);

    state = switch (result) {
      Success() => _applyRecentCancel(null),
      Failure(:final failure) => state.copyWith(error: failure.message),
    };

    if (result is Success) {
      await _refresh(publicCode);
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
