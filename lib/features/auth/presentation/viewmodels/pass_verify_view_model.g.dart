// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pass_verify_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PassVerifyViewModel)
final passVerifyViewModelProvider = PassVerifyViewModelProvider._();

final class PassVerifyViewModelProvider
    extends $NotifierProvider<PassVerifyViewModel, PassVerifyState> {
  PassVerifyViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passVerifyViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passVerifyViewModelHash();

  @$internal
  @override
  PassVerifyViewModel create() => PassVerifyViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PassVerifyState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PassVerifyState>(value),
    );
  }
}

String _$passVerifyViewModelHash() =>
    r'86870830dea78edf4d6f0f73aa902f659d3a9d00';

abstract class _$PassVerifyViewModel extends $Notifier<PassVerifyState> {
  PassVerifyState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PassVerifyState, PassVerifyState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PassVerifyState, PassVerifyState>,
              PassVerifyState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
