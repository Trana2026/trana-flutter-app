import 'package:trana/core/error/result.dart';
import 'package:trana/features/guardian/domain/entities/guardian_link_entity.dart';

/// 보호자 인증 관련 데이터 접근 인터페이스
abstract interface class GuardianRepository {
  /// 미성년자용 보호자 인증 링크 발급
  Future<Result<GuardianLinkEntity>> createGuardianLink();
}
