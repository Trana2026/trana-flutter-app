import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'receive_contract_view_model.freezed.dart';
part 'receive_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class ReceiveContractState with _$ReceiveContractState {
  const factory ReceiveContractState({
    String? invitationToken, // 수신된 초대 토큰
    @Default(false) bool isLoading,
    String? error,
  }) = _ReceiveContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class ReceiveContractViewModel extends _$ReceiveContractViewModel {
  @override
  ReceiveContractState build() => const ReceiveContractState();

  void loadToken(String token) =>
      state = state.copyWith(invitationToken: token);

  /// 수신된 초대 수락 (성공 여부 반환)
  Future<bool> accept() async {
    if (state.invitationToken == null) {
      state = state.copyWith(error: '초대 정보가 없습니다.');
      return false;
    }

    state = state.copyWith(isLoading: true, error: null);

    final result = await ref
        .read(contractInvitationRepositoryProvider)
        .acceptInvitation(state.invitationToken!);

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

  Future<void> _refreshHome() {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    return homeVM.readMyContracts();
  }

  void clearError() => state = state.copyWith(error: null);
}
