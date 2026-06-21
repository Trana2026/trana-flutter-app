import 'package:trana/core/error/result.dart';
import 'package:trana/features/auth/domain/entities/social_provider.dart';
import 'package:trana/features/auth/domain/entities/user_entity.dart';
import 'package:trana/features/auth/domain/repositories/auth_repository.dart';

/// 백엔드 API 연동 전 사용하는 AuthRepository Mock 구현체
class MockAuthRepository implements AuthRepository {
  /// 소셜 로그인 성공 시뮬레이션
  @override
  Future<Result<void>> socialSignIn({
    required SocialProvider provider,
    required String idToken,
    String ageGroup = 'MINOR',
  }) async {
    return const Success(null);
  }

  static final _mockUser = UserEntity(
    id: 1,
    publicId: 'USR20260001',
    ageGroup: 'ADULT',
    accountStatus: 'ACTIVE',
    name: '홍길동',
    email: 'hong@example.com',
    phone: '010-1234-5678',
    pushEnabled: true,
    createdAt: DateTime(2026, 1, 15),
  );

  /// 항상 mock 유저로 로그인 상태 시뮬레이션
  @override
  Future<Result<UserEntity>> getCurrentUser() async {
    return Success(_mockUser);
  }

  /// 로그아웃 성공 시뮬레이션
  @override
  Future<Result<void>> signOut() async {
    return const Success(null);
  }

  /// 회원 탈퇴 성공 시뮬레이션
  @override
  Future<Result<void>> deleteAccount() async {
    return const Success(null);
  }
}
