import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'share_contract_view_model.freezed.dart';
part 'share_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class ShareContractState with _$ShareContractState {
  const ShareContractState._();

  const factory ShareContractState({
    @Default('') String receiverName, // 수신자 이름 입력값
    @Default('') String receiverPhone, // 수신자 번호 입력값

    @Default(false) bool isLoading,
    String? error,
  }) = _ShareContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class ShareContractViewModel extends _$ShareContractViewModel {
  @override
  ShareContractState build() => const ShareContractState();

  void updateInput({required String name, required String phone}) =>
      state = state.copyWith(receiverName: name, receiverPhone: phone);

  /// 계약서 초안 상태 서명 요청 + 알림톡 발송 (성공 여부 반환)
  Future<bool> share(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .share(
          publicCode: publicCode,
          receiverName: state.receiverName,
          receiverPhone: state.receiverPhone,
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

  /// 수정 요청 상태 서명 요청 + 알림톡 발송 (성공 여부 반환)
  Future<bool> reshare(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .reshare(publicCode);

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

  Future<void> _refresh(String publicCode) async {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    await homeVM.readMyContracts();

    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    await detailVM.loadDetail(publicCode);
  }

  void clearError() => state = state.copyWith(error: null);
}
