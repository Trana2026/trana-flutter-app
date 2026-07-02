import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';

part 'guardian_link_view_model.freezed.dart';
part 'guardian_link_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class GuardianLinkState with _$GuardianLinkState {
  const factory GuardianLinkState({
    String? verifyUrl, // 발급된 보호자 인증 링크
    @Default(false) isConsented, // 이미 인증되었는지 여부

    @Default(false) bool isLoading,
    String? error,
  }) = _GuardianLinkState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class GuardianLinkViewModel extends _$GuardianLinkViewModel {
  @override
  GuardianLinkState build() => const GuardianLinkState();

  /// 요청자 미성년자 보호자 인증 링크 발급 (성공 여부 반환)
  Future<bool> getCreatorGuardianLink(String? publicCode) async {
    if (publicCode == null) {
      state = state.copyWith(error: "계약 정보가 없습니다");
      return false;
    }

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractGuardianConsentRepositoryProvider)
        .guardianConsent(publicCode);

    switch (result) {
      case Success(:final data):
        state = state.copyWith(isLoading: false, verifyUrl: data.verifyUrl);
        return true;
      case Failure(:final failure):
        if (failure is ConflictFailure) {
          state = state.copyWith(isLoading: false, isConsented: true);
          return true;
        }
        state = state.copyWith(isLoading: false, error: failure.message);
        return false;
    }
  }

  /// 수신자 미성년자 보호자 인증 링크 발급 (성공 여부 반환)
  Future<bool> getReceiverGuardianLink(String? publicCode) async {
    if (publicCode == null) {
      state = state.copyWith(error: "계약 정보가 없습니다");
      return false;
    }

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractGuardianConsentRepositoryProvider)
        .receiverGuardianConsent(publicCode);

    switch (result) {
      case Success(:final data):
        state = state.copyWith(isLoading: false, verifyUrl: data.verifyUrl);
        return true;
      case Failure(:final failure):
        if (failure is ConflictFailure) {
          state = state.copyWith(isLoading: false, isConsented: true);
          return true;
        }
        state = state.copyWith(isLoading: false, error: failure.message);
        return false;
    }
  }

  /// 미성년자 계약 생성 보호자 동의 여부 확인
  Future<bool> checkConsentApproved(String? publicCode) async {
    if (publicCode == null) {
      state = state.copyWith(error: "계약 정보가 없습니다");
      return false;
    }

    final result = await ref
        .read(contractDraftRepositoryProvider)
        .readDraft(publicCode: publicCode);

    return switch (result) {
      Success(:final data) => data.guardianConsentAt != null,
      Failure() => false,
    };
  }

  void clearError() => state = state.copyWith(error: null);
}
