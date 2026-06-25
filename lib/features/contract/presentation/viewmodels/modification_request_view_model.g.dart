// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modification_request_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ModificationRequestViewModel)
final modificationRequestViewModelProvider =
    ModificationRequestViewModelProvider._();

final class ModificationRequestViewModelProvider
    extends
        $NotifierProvider<
          ModificationRequestViewModel,
          ModificationRequestState
        > {
  ModificationRequestViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modificationRequestViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modificationRequestViewModelHash();

  @$internal
  @override
  ModificationRequestViewModel create() => ModificationRequestViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModificationRequestState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModificationRequestState>(value),
    );
  }
}

String _$modificationRequestViewModelHash() =>
    r'd3cdf6d486977d62c843596c311ed126e0d3226f';

abstract class _$ModificationRequestViewModel
    extends $Notifier<ModificationRequestState> {
  ModificationRequestState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<ModificationRequestState, ModificationRequestState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ModificationRequestState, ModificationRequestState>,
              ModificationRequestState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
