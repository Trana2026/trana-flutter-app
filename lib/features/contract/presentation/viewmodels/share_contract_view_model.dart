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
  const factory ShareContractState({
    String? publicCode, // 계약 publicCode
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

  void loadPublicCode(String publicCode) =>
      state = state.copyWith(publicCode: publicCode);

  void updateInput({required String name, required String phone}) =>
      state = state.copyWith(receiverName: name, receiverPhone: phone);

  /// 계약서 공유 (서명 요청) + 알림톡 발송 (성공 여부 반환)
  Future<bool> share() async {
    if (state.publicCode == null) {
      state = state.copyWith(error: '계약 정보가 없습니다.');
      return false;
    }

    state = state.copyWith(isLoading: true, error: null);

    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .fromReadyToShared(
          publicCode: state.publicCode!,
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
      await _refreshHome();
      await _refreshDetail();
    }

    return result is Success;
  }

  Future<void> _refreshHome() {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    return homeVM.readMyContracts();
  }

  Future<void> _refreshDetail() {
    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    return detailVM.refreshDetail();
  }

  void clearError() => state = state.copyWith(error: null);
}
