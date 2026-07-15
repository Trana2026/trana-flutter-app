import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/utils/validation.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';

part 'share_contract_view_model.freezed.dart';
part 'share_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class ShareContractState with _$ShareContractState {
  const ShareContractState._();

  const factory ShareContractState({
    @Default('') String receiverName, // 수신자 이름 입력값
    @Default('') String receiverPhone, // 수신자 번호 입력값

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

  /// 계약서 초안 상태 서명 요청 + 알림톡 발송
  Future<bool> share(String publicCode) async {
    // 본인 번호로의 서명 요청 방지
    final myPhone = ref.read(meProvider).value?.phone;
    if (myPhone != null &&
        Validation.normalizePhone(myPhone) ==
            Validation.normalizePhone(state.receiverPhone)) {
      state = state.copyWith(error: '본인 번호로는 서명 요청을 보낼 수 없습니다.');
      return false;
    }

    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .share(
          publicCode: publicCode,
          receiverName: state.receiverName,
          receiverPhone: state.receiverPhone,
        );

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

    if (result is Success) {
      await _refresh(publicCode);
    }

    return result is Success;
  }

  /// 수정 요청 상태 서명 요청 + 알림톡 발송
  Future<bool> reshare(String publicCode) async {
    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .reshare(publicCode);

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

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
