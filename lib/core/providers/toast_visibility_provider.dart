import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toast_visibility_provider.g.dart';

/// 토스트가 화면에 떠 있는지 여부.
/// 홈 하단 배너처럼 토스트와 겹치면 안 되는 UI가 위치를 조정할 때 참조
@riverpod
class ToastVisibility extends _$ToastVisibility {
  @override
  bool build() => false;

  void show() => state = true;

  void hide() => state = false;
}
