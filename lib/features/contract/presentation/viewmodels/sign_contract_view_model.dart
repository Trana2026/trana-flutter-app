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
    @Default('') String signatureBase64, // 전자 서명 데이터
    @Default([]) List<int> agreedTermIds, // 동의한 약관 id 목록

    String? error,
  }) = _SignContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class SignContractViewModel extends _$SignContractViewModel {
  @override
  SignContractState build() => const SignContractState();

  /// 서명 플로우 시작 전에 이전 시도 초기화
  void reset() {
    state = const SignContractState();
  }

  /// 서명 필수 약관 조회 후 동의 약관 id 설정 (성공 여부 반환)
  Future<bool> loadRequiredTerms() async {
    final result = await ref.read(termsRepositoryProvider).readContractTerms();

    switch (result) {
      case Success(:final data):
        state = state.copyWith(agreedTermIds: data.map((e) => e.id).toList());
        return true;
      case Failure(:final failure):
        state = state.copyWith(error: failure.message);
        return false;
    }
  }

  /// 전자 서명 데이터
  void getSignature(String v) {
    state = state.copyWith(signatureBase64: v);
  }

  /// 수신자 서명 제출 후 계약 목록 및 상세 정보 갱신
  Future<bool> receiverSign(String publicCode) async {
    final result = await ref
        .read(contractInvitationRepositoryProvider)
        .receiverSign(
          publicCode: publicCode,
          signatureBase64: state.signatureBase64,
          agreedTermIds: state.agreedTermIds,
        );

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

    if (result is Success) {
      await _refresh(publicCode);
      reset();
    }

    return result is Success;
  }

  /// 생성자 최종 서명 제출 후 계약 목록 및 상세 정보 갱신
  Future<bool> creatorSign(String publicCode) async {
    final result = await ref
        .read(contractLifecycleRepositoryProvider)
        .creatorSign(
          publicCode: publicCode,
          signatureBase64: state.signatureBase64,
          agreedTermIds: state.agreedTermIds,
        );

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

    if (result is Success) {
      await _refresh(publicCode);
      reset();
    }

    return result is Success;
  }

  /// 계약 목록 및 상세 정보 갱신
  Future<void> _refresh(String? publicCode) async {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    await homeVM.readMyContracts();

    if (publicCode == null) return;

    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    await detailVM.loadDetail(publicCode);
  }

  void clearError() => state = state.copyWith(error: null);
}
