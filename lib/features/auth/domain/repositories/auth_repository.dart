import 'package:trana/core/error/result.dart';
import 'package:trana/features/auth/domain/entities/social_provider.dart';
import 'package:trana/features/auth/domain/entities/user_entity.dart';

/// 인증 관련 데이터 접근 인터페이스
abstract interface class AuthRepository {
  /// 소셜 로그인 idToken으로 JWT 발급 후 토큰 저장
  Future<Result<void>> socialSignIn({
    required SocialProvider provider,
    required String idToken,
    String ageGroup,
  });

  /// 저장된 토큰으로 현재 로그인 유저 조회
  Future<Result<UserEntity>> getCurrentUser();

  /// 로컬 인증 토큰 삭제 후 로그아웃
  Future<Result<void>> signOut();

  /// 계정 회원 탈퇴
  Future<Result<void>> deleteAccount();
}
