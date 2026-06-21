/// 계약 상태
enum ContractStatus {
  inProgress, // 초안 작성중
  draft, // 초안
  ready, // 초안 준비 완료
  shared, // 공유 + 서명 요청

  revisionRequested, // 수정 요청
  receiverSigned, // 수신자 1차 서명
  cancelRequested, // 취소 요청
  cancelled, // 취소 확정

  signed, // 최종 2차 서명
  completed, // 거래 완료
}
