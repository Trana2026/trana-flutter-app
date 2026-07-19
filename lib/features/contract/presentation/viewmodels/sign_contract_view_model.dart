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

  /// 거래 계약 약관 동의
  void agreeContractAgreementTerm() {
    // 약관 정확히 2개 아니면 예외 터짐
    // keepAlive 상태라 재시도 시 중복 누적될 수 있어서 {}(set) 사용
    final updated = {...state.agreedTermIds, 5}.toList();
    state = state.copyWith(agreedTermIds: updated);
  }

  /// 전자서명 약관 동의
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
