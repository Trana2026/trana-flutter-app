/// 계약서 PDF 저장/공유 결과
enum PdfExportResult {
  /// 저장 완료 또는 공유 앱으로 전달 완료
  success,

  /// 사용자가 저장/공유 화면을 닫음
  cancelled,

  /// 파일 준비 또는 저장/공유 실패
  failure,
}
