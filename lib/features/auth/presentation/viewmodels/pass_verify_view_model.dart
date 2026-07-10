import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/auth/data/models/pass_result_dto.dart';

part 'pass_verify_view_model.freezed.dart';
part 'pass_verify_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class PassVerifyState with _$PassVerifyState {
  const factory PassVerifyState({
    @Default(false) bool isLoading,
    @Default(false) bool requiresGuardian,
    String? error,
  }) = _PassVerifyState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class PassVerifyViewModel extends _$PassVerifyViewModel {
  @override
  PassVerifyState build() => const PassVerifyState();

  /// 웹 브릿지(onPassResult) payload 처리 후 로그인 완료
  /// 성공 여부 반환
  Future<bool> completeSignIn(Map<String, dynamic> payload) async {
    state = state.copyWith(isLoading: true, error: null);

    final dto = PassResultDto.fromJson(payload);

    if (!dto.isSignUpSuccess) {
      state = state.copyWith(
        isLoading: false,
        error: dto.resultMsg ?? '본인 인증에 실패했습니다. 다시 시도해주세요.',
      );
      return false;
    }

    final result = await ref
        .read(passAuthRepositoryProvider)
        .completePassSignIn(dto.toEntity());

    state = switch (result) {
      Success() => state.copyWith(
        isLoading: false,
        requiresGuardian: dto.requiresGuardian ?? false,
      ),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  void clearError() => state = state.copyWith(error: null);
}
