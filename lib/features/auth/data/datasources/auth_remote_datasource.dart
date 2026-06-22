import 'package:dio/dio.dart';
import 'package:trana/features/auth/data/models/sign_in_response_dto.dart';

/// 인증 인터페이스
abstract interface class AuthRemoteDatasource {
  /// 소셜 로그인.
  /// 클라이언트가 받은 idToken을 서버가 검증 후 JWT 발급
  Future<SignInResponseDto> socialSignIn({
    required String provider,
    required String idToken,
    required String ageGroup,
  });

  /// 회원 탈퇴
  Future<void> deleteMe();
}

/// 인증 구현체
class DioAuthRemoteDatasource implements AuthRemoteDatasource {
  final Dio _dio;
  const DioAuthRemoteDatasource(this._dio);

  /// POST /v1/auth/social/sign-in
  @override
  Future<SignInResponseDto> socialSignIn({
    required String provider,
    required String idToken,
    required String ageGroup,
  }) async {
    final response = await _dio.post(
      '/v1/auth/social/sign-in',
      data: {'provider': provider, 'idToken': idToken, 'ageGroup': ageGroup},
    );
    return SignInResponseDto.fromJson(response.data as Map<String, dynamic>);
  }

  /// DELETE /v1/users/me (JWT필요, AuthInterceptor가 자동 부착)
  @override
  Future<void> deleteMe() async {
    await _dio.delete('/v1/users/me');
  }
}
