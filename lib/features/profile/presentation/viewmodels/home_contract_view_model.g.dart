// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_contract_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeContractViewModel)
final homeContractViewModelProvider = HomeContractViewModelProvider._();

final class HomeContractViewModelProvider
    extends $NotifierProvider<HomeContractViewModel, HomeContractState> {
  HomeContractViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeContractViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeContractViewModelHash();

  @$internal
  @override
  HomeContractViewModel create() => HomeContractViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeContractState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeContractState>(value),
    );
  }
}

String _$homeContractViewModelHash() =>
    r'4f1437764f664a164a21a776ad7e391b3eeebbdf';

abstract class _$HomeContractViewModel extends $Notifier<HomeContractState> {
  HomeContractState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<HomeContractState, HomeContractState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomeContractState, HomeContractState>,
              HomeContractState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
