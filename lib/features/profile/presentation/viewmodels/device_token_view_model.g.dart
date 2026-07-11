// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_token_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeviceTokenViewModel)
final deviceTokenViewModelProvider = DeviceTokenViewModelProvider._();

final class DeviceTokenViewModelProvider
    extends $NotifierProvider<DeviceTokenViewModel, DeviceTokenState> {
  DeviceTokenViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceTokenViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceTokenViewModelHash();

  @$internal
  @override
  DeviceTokenViewModel create() => DeviceTokenViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceTokenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceTokenState>(value),
    );
  }
}

String _$deviceTokenViewModelHash() =>
    r'97d9efd7e21781e0d9c98dcff4f7ab3037050e92';

abstract class _$DeviceTokenViewModel extends $Notifier<DeviceTokenState> {
  DeviceTokenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DeviceTokenState, DeviceTokenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DeviceTokenState, DeviceTokenState>,
              DeviceTokenState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
