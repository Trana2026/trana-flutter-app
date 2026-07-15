/// 계약 취소 요청 사유
enum CancellationReason {
  reportHistory, // 신고 이력
  cancellationRisk; // 계약 취소 위험

  String get label => switch (this) {
    CancellationReason.reportHistory => '신고 이력이 있어요',
    CancellationReason.cancellationRisk => '계약 취소 위험이 있어요',
  };
}
