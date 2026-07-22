/// 약관 유형
enum TermsType {
  // 온보딩 (가입)
  service, // 서비스 이용약관 (동의)
  privacy, // 개인정보 수집·이용 동의
  privacyPolicy, // 개인정보 처리방침 (열람 전용 — 동의 X)
  thirdParty, // 개인정보 제3자 제공 동의
  marketing, // 마케팅 정보 수신 동의 (선택)
  location, // 위치정보 이용 동의 (레거시 유지)
  // 계약
  contractAgreement, // 계약 동의 (서명 필수에서 제거, 레거시 유지 — plan 1-2)
  electronicSignature, // 전자서명 동의 (계약 서명 필수)
  // AI 자동기입
  aiAutofillNotice, // AI 자동기입 면책 고지 (readonly 열람)
  aiCrossBorder, // AI 자동기입 국외이전 동의 (필수 체크, 개인정보보호법 §28-8)
}
