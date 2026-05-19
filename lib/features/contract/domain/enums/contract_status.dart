/// 계약 상태
enum ContractStatus {
  draft, // 계약서 초안
  signRequested, // 서명 요청
  signed, // 서명 완료
  completed, // 거래 완료
  reported, // 신고 접수
}
