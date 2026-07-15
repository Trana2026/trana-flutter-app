import 'package:flutter/material.dart';

/// 앱 전반에서 사용하는 표준 스타일(반투명 배경 + 투명 배경색 + 스크롤 허용) 바텀시트
Future<T?> showCustomBottomSheet<T>(BuildContext context, Widget child) {
  return showModalBottomSheet<T>(
    context: context,
    barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => child,
  );
}
