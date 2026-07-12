import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/services/pending_invitation_token_service.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'receive_contract_view_model.freezed.dart';
part 'receive_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class ReceiveContractState with _$ReceiveContractState {
  const factory ReceiveContractState({
    String? publicCode, // 수신된 계약 publicCode
    @Default(0) int warrantyPeriodDays, // 선택된 보증 제공 여부 (0: 미제공, 3: 제공)

    @Default(false) bool isLoading,
    String? error,
  }) = _ReceiveContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class ReceiveContractViewModel extends _$ReceiveContractViewModel {
  @override
  ReceiveContractState build() => const ReceiveContractState();

  /// 수신자 초대 수락 (성공 여부 반환)
  Future<bool> accept() async {
    state = state.copyWith(isLoading: true);

    final invitationToken = await PendingInvitationTokenService.get();
    if (invitationToken == null) {
      state = state.copyWith(isLoading: false);
      return true;
    }

    final result = await ref
        .read(contractInvitationRepositoryProvider)
        .acceptInvitation(invitationToken);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoading: false,
        publicCode: data.publicCode,
      ),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    if (result is Success) {
      await PendingInvitationTokenService.clear();
      await _refresh(state.publicCode);
    }

    // 영구 실패한 초대 토큰 폐기
    if (result case Failure(:final failure) when failure.isPermanent) {
      await PendingInvitationTokenService.clear();
    }

    return result is Success;
  }

  /// 보증 제공 여부 선택
  void updateWarrantyPeriod(int v) =>
      state = state.copyWith(warrantyPeriodDays: v);

  /// 수신자(판매자) 보증 기간 변경 (성공 여부 반환)
  Future<bool> receiverWarranty(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractInvitationRepositoryProvider)
        .receiverWarranty(
          publicCode: publicCode,
          warrantyPeriodDays: state.warrantyPeriodDays,
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

  Future<void> _refresh(String? publicCode) async {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    await homeVM.readMyContracts();

    if (publicCode == null) return;

    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    await detailVM.loadDetail(publicCode);
  }

  void clearError() => state = state.copyWith(error: null);
}
