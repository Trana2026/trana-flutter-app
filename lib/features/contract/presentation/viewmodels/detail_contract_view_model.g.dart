// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_contract_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DetailContractViewModel)
final detailContractViewModelProvider = DetailContractViewModelProvider._();

final class DetailContractViewModelProvider
    extends $NotifierProvider<DetailContractViewModel, DetailContractState> {
  DetailContractViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'detailContractViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$detailContractViewModelHash();

  @$internal
  @override
  DetailContractViewModel create() => DetailContractViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DetailContractState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DetailContractState>(value),
    );
  }
}

String _$detailContractViewModelHash() =>
    r'9ebc5c9f311667a8793ef8ebb7334e0a44286b8c';

abstract class _$DetailContractViewModel
    extends $Notifier<DetailContractState> {
  DetailContractState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DetailContractState, DetailContractState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DetailContractState, DetailContractState>,
              DetailContractState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
