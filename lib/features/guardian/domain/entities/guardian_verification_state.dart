/// 보호자 인증 진행 상태
enum GuardianVerificationState {
  /// 링크 미발급 (아직 인증 시작 안 함)
  notIssued,

  /// 링크 발급됨, 보호자 인증 대기 중 (만료 전)
  pending,

  /// 보호자 인증 완료
  verified,

  /// 링크 만료 (재발급 필요)
  expired,
}
