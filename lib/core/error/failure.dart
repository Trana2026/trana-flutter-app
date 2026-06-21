/// 앱 전반의 실패 원인을 표현하는 sealed 클래스
sealed class AppFailure {
  final String message;
  const AppFailure(this.message);
}

/// 네트워크 연결 실패
class NetworkFailure extends AppFailure {
  const NetworkFailure([super.message = '네트워크 오류가 발생했습니다.']);
}

/// 서버 내부 오류 (5xx)
class ServerFailure extends AppFailure {
  const ServerFailure([super.message = '서버 오류가 발생했습니다.']);
}

/// 인증 만료 또는 미인증 상태
class UnauthorizedFailure extends AppFailure {
  const UnauthorizedFailure([super.message = '인증이 필요합니다.']);
}

/// 본인/보호자 인증(eKYC) 미완료로 인한 작업 거부
class KycFailure extends AppFailure {
  const KycFailure(super.message);
}

/// 로컬 캐시 저장/조회 실패
class CacheFailure extends AppFailure {
  const CacheFailure([super.message = '로컬 저장 오류가 발생했습니다.']);
}

/// 접근 권한 없음 (403)
class ForbiddenFailure extends AppFailure {
  const ForbiddenFailure([super.message = '접근 권한이 없습니다.']);
}

/// 현재 상태와 충돌하는 요청 (409)
class ConflictFailure extends AppFailure {
  const ConflictFailure([super.message = '현재 상태에서 수행할 수 없는 작업입니다.']);
}

/// 이미 삭제된 리소스 (410)
class GoneFailure extends AppFailure {
  const GoneFailure([super.message = '이미 삭제된 항목입니다.']);
}

/// 존재하지 않는 리소스 (404)
class NotFoundFailure extends AppFailure {
  const NotFoundFailure([super.message = '존재하지 않거나 삭제된 항목입니다.']);
}

/// 요청 값 검증 실패 (422)
class ValidationFailure extends AppFailure {
  const ValidationFailure([super.message = '요청 값이 올바르지 않습니다.']);
}

/// 분류되지 않은 예외 상황
class UnknownFailure extends AppFailure {
  const UnknownFailure([super.message = '알 수 없는 오류가 발생했습니다.']);
}

// ── eKYC 관련 실패 ───────────────────────────────────────────

/// 신분증 OCR 인식 실패 (IDENTITY_422_OCR) — 사진 재촬영 유도
class OcrFailure extends AppFailure {
  const OcrFailure([super.message = '신분증을 인식하지 못했습니다. 다시 촬영해주세요.']);
}

/// 신분증 진위확인 실패 (IDENTITY_422_VERIFY) — hint 필드로 재시도 유형 안내
class VerifyFailure extends AppFailure {
  final String? hint;
  const VerifyFailure({
    String message = '신분증 진위확인에 실패했습니다. 다시 촬영해주세요.',
    this.hint,
  }) : super(message);
}

/// 얼굴 불일치 (IDENTITY_422_COMPARE) — 셀카 재촬영 유도
class FaceCompareFailure extends AppFailure {
  const FaceCompareFailure([super.message = '얼굴 인증에 실패했습니다. 다시 촬영해주세요.']);
}

/// OCR 또는 가입 세션 만료 (IDENTITY_410_SESSION / IDENTITY_410_SIGNUP)
class SessionExpiredFailure extends AppFailure {
  /// true: 약관 동의부터 재시작 (signupSessionId 만료)
  /// false: 신분증 촬영부터 재시작 (requestId 만료)
  final bool isSignupSession;
  const SessionExpiredFailure({
    required this.isSignupSession,
    String message = '인증 세션이 만료되었습니다. 처음부터 다시 시작해주세요.',
  }) : super(message);
}

/// 이미 인증된 신분증 (IDENTITY_409_DUPLICATE) — 로그인 유도
class DuplicateIdentityFailure extends AppFailure {
  const DuplicateIdentityFailure([super.message = '이미 인증된 신분증입니다. 로그인을 시도해주세요.']);
}

/// 보호자 링크 만료/없음/이미 사용됨 (GUARDIAN_410_LINK / GUARDIAN_404_LINK)
class GuardianLinkExpiredFailure extends AppFailure {
  const GuardianLinkExpiredFailure([super.message = '보호자 인증 링크가 만료되었습니다. 새 링크를 요청해주세요.']);
}

// ── 미성년 플로우(소셜 + 보호자) 관련 실패 ──────────────────────

/// 소셜 로그인 인증 실패 (AUTH_401_SOCIAL) — 소셜 토큰 검증 실패
class SocialAuthFailure extends AppFailure {
  const SocialAuthFailure([super.message = '로그인에 실패했습니다. 잠시 후 다시 시도해 주세요.']);
}

/// 이미 보호자 인증이 완료된 사용자 (GUARDIAN_409_VERIFIED) — 홈으로 분기
class GuardianAlreadyVerifiedFailure extends AppFailure {
  const GuardianAlreadyVerifiedFailure([super.message = '이미 보호자 인증이 완료되었습니다.']);
}

/// 보호자 링크 발급 대상이 미성년자가 아님 (GUARDIAN_403_NOT_MINOR)
class GuardianNotMinorFailure extends AppFailure {
  const GuardianNotMinorFailure([super.message = '미성년자 계정만 보호자 인증을 요청할 수 있습니다.']);
}
