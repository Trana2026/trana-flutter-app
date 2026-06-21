import 'package:trana/core/error/result.dart';
import 'package:trana/features/user/domain/entities/user_me_entity.dart';

/// 사용자 정보 데이터 접근 인터페이스
abstract interface class UserRepository {
  /// 현재 사용자 정보 조회 (GET /v1/users/me)
  Future<Result<UserMeEntity>> getMe();
}
