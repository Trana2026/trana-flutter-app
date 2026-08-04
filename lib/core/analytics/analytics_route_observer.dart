import 'package:flutter/widgets.dart';
import 'package:trana/core/analytics/analytics_service.dart';

/// 라우트 전환마다 EVT-001(screen_view)을 자동 전송
/// GoRoute에 name 을 지정하지 않아도 라우트의 path 로 채움
/// didPush는 실제 push 시 1회만 호출되어 재렌더링 시 중복 전송되지 않음
class AnalyticsRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _trackScreenView(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) _trackScreenView(newRoute, oldRoute);
  }

  void _trackScreenView(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final screenName = route.settings.name;
    if (screenName == null || screenName.isEmpty) return;

    // EVT-001: screen_view
    AnalyticsService.trackScreenView(
      screenName,
      entryPoint: previousRoute?.settings.name,
    );
  }
}
