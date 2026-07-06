import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'sign_contract_view_model.freezed.dart';
part 'sign_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class SignContractState with _$SignContractState {
  const factory SignContractState({
    @Default('') String signatureBase64,
    @Default([]) List<int> agreedTermIds, // 동의한 약관 id 목록

    @Default(false) bool isLoading,
    String? error,
  }) = _SignContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class SignContractViewModel extends _$SignContractViewModel {
  @override
  SignContractState build() => const SignContractState();

  /// 서명 플로우 시작 전 이전 시도의 잔여 상태 초기화
  void reset() {
    state = const SignContractState();
  }

  /// TRANA 거래 계약 동의 (id: 5)
  void agreeContractAgreementTerm() {
    // keepAlive 상태라 재시도 시 중복 누적 방지 (서버가 약관 2개 정확히 요구)
    final updated = {...state.agreedTermIds, 5}.toList();
    state = state.copyWith(agreedTermIds: updated);
  }

  /// TRANA 전자서명 동의 (id: 6)
  void agreeElectronicSignatureTerm(bool v) {
    final updated = {...state.agreedTermIds};
    if (v) {
      updated.add(6);
    } else {
      updated.remove(6);
    }
    state = state.copyWith(agreedTermIds: updated.toList());
  }

  /// 전자 서명 데이터
  void getSignature(String v) {
    state = state.copyWith(signatureBase64: v);
  }

  /// 수신자 서명 (성공 여부 반환)
  Future<bool> receiverSign(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractInvitationRepositoryProvider)
        .receiverSign(
          publicCode: publicCode,
          signatureBase64: state.signatureBase64,
          agreedTermIds: state.agreedTermIds,
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
      reset();
    }

    return result is Success;
  }

  /// 생성자 최종 서명 (성공 여부 반환)
  Future<bool> creatorSign(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .creatorSign(
          publicCode: publicCode,
          signatureBase64: state.signatureBase64,
          agreedTermIds: state.agreedTermIds,
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
      reset();
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
