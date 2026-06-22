import 'package:trana/core/error/result.dart';
import 'package:trana/features/auth/domain/entities/social_provider.dart';
import 'package:trana/features/auth/domain/repositories/auth_repository.dart';

/// 소셜 로그인 idToken으로 가입/로그인 처리
class SocialSignInUseCase {
  final AuthRepository _repository;
  const SocialSignInUseCase(this._repository);

  /// 미성년 가입: idToken 검증 후 JWT 발급/저장
  Future<Result<void>> call({
    required SocialProvider provider,
    required String idToken,
  }) {
    return _repository.socialSignIn(
      provider: provider,
      idToken: idToken,
      ageGroup: 'MINOR',
    );
  }
}
