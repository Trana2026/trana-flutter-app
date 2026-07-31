// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_occupied_height_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 배너(+토스트)가 화면 하단에서 차지하는 총 높이
/// 계약서 목록처럼 배너와 겹치면 안 되는 UI가 하단 패딩을 조정할 때 참조

@ProviderFor(BannerOccupiedHeight)
final bannerOccupiedHeightProvider = BannerOccupiedHeightProvider._();

/// 배너(+토스트)가 화면 하단에서 차지하는 총 높이
/// 계약서 목록처럼 배너와 겹치면 안 되는 UI가 하단 패딩을 조정할 때 참조
final class BannerOccupiedHeightProvider
    extends $NotifierProvider<BannerOccupiedHeight, double> {
  /// 배너(+토스트)가 화면 하단에서 차지하는 총 높이
  /// 계약서 목록처럼 배너와 겹치면 안 되는 UI가 하단 패딩을 조정할 때 참조
  BannerOccupiedHeightProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bannerOccupiedHeightProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bannerOccupiedHeightHash();

  @$internal
  @override
  BannerOccupiedHeight create() => BannerOccupiedHeight();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$bannerOccupiedHeightHash() =>
    r'86da2c85f5f9e6d879be1b05eabde5364fa8d72d';

/// 배너(+토스트)가 화면 하단에서 차지하는 총 높이
/// 계약서 목록처럼 배너와 겹치면 안 되는 UI가 하단 패딩을 조정할 때 참조

abstract class _$BannerOccupiedHeight extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
