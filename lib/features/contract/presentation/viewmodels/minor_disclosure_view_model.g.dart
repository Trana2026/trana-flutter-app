// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minor_disclosure_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MinorDisclosureViewModel)
final minorDisclosureViewModelProvider = MinorDisclosureViewModelProvider._();

final class MinorDisclosureViewModelProvider
    extends $NotifierProvider<MinorDisclosureViewModel, MinorDisclosureState> {
  MinorDisclosureViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'minorDisclosureViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$minorDisclosureViewModelHash();

  @$internal
  @override
  MinorDisclosureViewModel create() => MinorDisclosureViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MinorDisclosureState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MinorDisclosureState>(value),
    );
  }
}

String _$minorDisclosureViewModelHash() =>
    r'7103d08640e3ad0759288f6c4dd62c28db21eb94';

abstract class _$MinorDisclosureViewModel
    extends $Notifier<MinorDisclosureState> {
  MinorDisclosureState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MinorDisclosureState, MinorDisclosureState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MinorDisclosureState, MinorDisclosureState>,
              MinorDisclosureState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
