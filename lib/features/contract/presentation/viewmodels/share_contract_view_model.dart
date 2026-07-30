import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
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
    @Default('') String receiverCode, // 수신자 고유코드 입력값

    String? error,
  }) = _ShareContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class ShareContractViewModel extends _$ShareContractViewModel {
  @override
  ShareContractState build() => const ShareContractState();

  void updateInput({required String code}) =>
      state = state.copyWith(receiverCode: code.toUpperCase());

  /// 계약서 초안 상태 서명 요청 + 알림톡 발송
  Future<bool> share(String publicCode) async {
    final receiverCode = state.receiverCode.trim().toUpperCase();

    // 본인 고유코드로의 서명 요청 방지
    final myShareCode = ref.read(meProvider).value?.shareCode;
    if (myShareCode != null && myShareCode == receiverCode) {
      state = state.copyWith(error: '본인에게는 서명 요청을 보낼 수 없습니다.');
      return false;
    }

    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .share(
          publicCode: publicCode,
          receiverCode: receiverCode,
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
