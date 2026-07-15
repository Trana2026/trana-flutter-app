// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revision_request_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RevisionRequestViewModel)
final revisionRequestViewModelProvider = RevisionRequestViewModelProvider._();

final class RevisionRequestViewModelProvider
    extends $NotifierProvider<RevisionRequestViewModel, RevisionRequestState> {
  RevisionRequestViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'revisionRequestViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$revisionRequestViewModelHash();

  @$internal
  @override
  RevisionRequestViewModel create() => RevisionRequestViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RevisionRequestState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RevisionRequestState>(value),
    );
  }
}

String _$revisionRequestViewModelHash() =>
    r'875e3f986573a18731a5f5c26c23b2c9d4221c5c';

abstract class _$RevisionRequestViewModel
    extends $Notifier<RevisionRequestState> {
  RevisionRequestState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<RevisionRequestState, RevisionRequestState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RevisionRequestState, RevisionRequestState>,
              RevisionRequestState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
