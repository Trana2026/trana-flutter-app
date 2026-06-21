import 'package:trana/core/error/result.dart';
import 'package:trana/features/guardian/domain/entities/guardian_link_entity.dart';
import 'package:trana/features/guardian/domain/entities/user_me_entity.dart';

/// 보호자 인증 관련 데이터 접근 인터페이스
abstract interface class GuardianRepository {
  /// 미성년자용 보호자 인증 링크 발급
  Future<Result<GuardianLinkEntity>> createGuardianLink();

  /// 현재 사용자 정보 조회 (guardianVerifiedAt 폴링용)
  Future<Result<UserMeEntity>> getMe();
}
