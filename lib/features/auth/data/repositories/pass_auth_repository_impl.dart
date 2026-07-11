import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/network/auth_token_store.dart';
import 'package:trana/features/auth/domain/entities/pass_result_entity.dart';
import 'package:trana/features/auth/domain/repositories/pass_auth_repository.dart';

class PassAuthRepositoryImpl implements PassAuthRepository {
  final AuthTokenStore _tokenStore;

  const PassAuthRepositoryImpl(this._tokenStore);

  @override
  Future<Result<void>> completePassSignIn(PassResultEntity result) async {
    try {
      if (result.accessToken.isEmpty || result.refreshToken.isEmpty) {
        return const Failure(UnknownFailure('인증 토큰이 비어 있습니다.'));
      }
      _tokenStore.accessToken = result.accessToken;
      _tokenStore.refreshToken = result.refreshToken;
      return const Success(null);
    } catch (e) {
      return Failure(UnknownFailure('로그인 처리에 실패했습니다: $e'));
    }
  }
}
