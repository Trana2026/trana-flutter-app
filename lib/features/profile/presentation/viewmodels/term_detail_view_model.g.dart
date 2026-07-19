// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TermDetailViewModel)
final termDetailViewModelProvider = TermDetailViewModelProvider._();

final class TermDetailViewModelProvider
    extends $NotifierProvider<TermDetailViewModel, TermDetailState> {
  TermDetailViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'termDetailViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$termDetailViewModelHash();

  @$internal
  @override
  TermDetailViewModel create() => TermDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TermDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TermDetailState>(value),
    );
  }
}

String _$termDetailViewModelHash() =>
    r'9b5eaeeb34132ae4172fcee799e29298c62293d3';

abstract class _$TermDetailViewModel extends $Notifier<TermDetailState> {
  TermDetailState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TermDetailState, TermDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TermDetailState, TermDetailState>,
              TermDetailState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
