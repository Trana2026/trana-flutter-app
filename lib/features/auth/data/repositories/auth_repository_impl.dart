import 'package:dio/dio.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/network/api_error_mapper.dart';
import 'package:trana/core/network/auth_token_store.dart';
import 'package:trana/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:trana/features/auth/domain/entities/social_provider.dart';
import 'package:trana/features/auth/domain/repositories/auth_repository.dart';

/// AuthRepository 실 구현체 (Dio + 토큰 저장소)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remote;
  final AuthTokenStore _tokenStore;

  const AuthRepositoryImpl(this._remote, this._tokenStore);

  /// 소셜 로그인 (idToken 검증 후 JWT 발급받아 secure storage 저장)
  @override
  Future<Result<void>> socialSignIn({
    required SocialProvider provider,
    required String idToken,
    String ageGroup = 'MINOR',
  }) async {
    try {
      final dto = await _remote.socialSignIn(
        provider: provider.apiValue,
        idToken: idToken,
        ageGroup: ageGroup,
      );
      _tokenStore.accessToken = dto.accessToken;
      _tokenStore.refreshToken = dto.refreshToken;
      return const Success(null);
    } on DioException catch (e) {
      return Failure(ApiErrorMapper.map(e));
    } catch (_) {
      return Failure(const UnknownFailure());
    }
  }

  /// 로컬 토큰 삭제
  @override
  Future<Result<void>> signOut() async {
    await _tokenStore.clear();
    return const Success(null);
  }

  /// 회원 탈퇴 후 토큰 삭제
  @override
  Future<Result<void>> deleteAccount() async {
    try {
      await _remote.deleteMe();
      await _tokenStore.clear();
      return const Success(null);
    } on DioException catch (e) {
      return Failure(ApiErrorMapper.map(e));
    } catch (_) {
      return Failure(const UnknownFailure());
    }
  }
}
