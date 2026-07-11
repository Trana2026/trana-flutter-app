import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/entities/user_consent_entity.dart';

part 'user_consent_view_model.freezed.dart';
part 'user_consent_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class UserConsentState with _$UserConsentState {
  const factory UserConsentState({
    @Default([]) List<UserConsentEntity> consents, // 본인 약관 동의 목록

    @Default(false) bool isLoading,
    String? error,
  }) = _UserConsentState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class UserConsentViewModel extends _$UserConsentViewModel {
  @override
  UserConsentState build() => const UserConsentState();

  /// 본인 약관 동의 내역 조회 (성공 여부 반환)
  Future<bool> readConsents() async {
    state = state.copyWith(isLoading: true);

    final result = await ref.read(userConsentRepositoryProvider).readConsents();

    state = switch (result) {
      Success(:final data) => state.copyWith(isLoading: false, consents: data),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  void clearError() => state = state.copyWith(error: null);
}
