import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/auth/domain/entities/user_entity.dart';
import 'package:trana/features/auth/domain/repositories/auth_repository.dart';

part 'auth_view_model.g.dart';

/// 로그인 상태 및 인증 관련 ViewModel
@riverpod
class AuthViewModel extends _$AuthViewModel {
  AuthRepository get _repository => ref.read(authRepositoryProvider);

  /// 앱 시작 시 현재 로그인 유저 조회
  @override
  Future<UserEntity?> build() async {
    final result = await _repository.getCurrentUser();
    return switch (result) {
      Success(:final data) => data,
      Failure() => null,
    };
  }

  /// 로컬 인증 토큰 삭제 후 로그아웃 처리
  Future<void> signOut() async {
    await _repository.signOut();
    state = const AsyncData(null);
  }
}
