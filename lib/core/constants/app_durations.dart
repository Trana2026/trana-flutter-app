/// 앱 전반 UI 애니메이션 표준 지속시간
class AppDurations {
  AppDurations._();

  /// 체크,선택 등 상태 토글 전환
  static const toggle = Duration(milliseconds: 200);

  /// 슬라이드,캐러셀 등 기본 전환
  static const transition = Duration(milliseconds: 250);

  /// 펼침,앱바,배너 등 확장 전환
  static const expand = Duration(milliseconds: 300);
}
