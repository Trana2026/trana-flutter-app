import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'banner_occupied_height_provider.g.dart';

const double _defaultBottom = 10;
const double _toastAvoidanceBottom = 81; // 기본 10 + 토스트 높이 63 + spacing 8
const double _bannerHeight = 63;
const double _bannerGap = 8;

/// 배너(+토스트)가 화면 하단에서 차지하는 총 높이
/// 계약서 목록처럼 배너와 겹치면 안 되는 UI가 하단 패딩을 조정할 때 참조
@riverpod
class BannerOccupiedHeight extends _$BannerOccupiedHeight {
  @override
  double build() => 0;

  void update(double value) => state = value;

  static ({double bottomOffset, double occupiedHeight}) calculate({
    required bool showToast,
    required int bannerCount,
  }) {
    final bottomOffset = showToast ? _toastAvoidanceBottom : _defaultBottom;

    final hasOverlay = bannerCount > 0 || showToast;
    if (!hasOverlay) {
      return (bottomOffset: bottomOffset, occupiedHeight: 0);
    }

    final stackHeight = bannerCount == 0
        ? 0
        : bannerCount * _bannerHeight + (bannerCount - 1) * _bannerGap;
    return (
      bottomOffset: bottomOffset,
      occupiedHeight: bottomOffset + stackHeight,
    );
  }
}
