import 'package:trana/core/error/result.dart';
import 'package:trana/features/auth/domain/entities/pass_result_entity.dart';

/// PASS 본인확인 결과 처리 인터페이스
abstract interface class PassAuthRepository {
  /// PASS 인증으로 발급된 JWT 저장 후 로그인 상태 확정
  Future<Result<void>> completePassSignIn(PassResultEntity result);
}
