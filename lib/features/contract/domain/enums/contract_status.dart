/// 계약 상태
enum ContractStatus {
  // 초안 상태
  inProgress, // 초안 작성중
  draft, // 초안
  ready, // 초안 준비 완료

  // 공유된 상태 (정상 흐름)
  shared, // 서명 요청
  revisionRequested, // 수정 요청
  receiverSigned, // 수신자 1차 서명 완료

  // 공유된 상태 (예외 흐름)
  cancelRequested, // 취소 요청
  cancelled, // 취소 확정
  expired, // 기간 만료

  // 양측 서명 완료된 상태
  signed, // 최종 2차 서명 완료
  completed, // 거래 완료
  reported, // 신고 접수
}
