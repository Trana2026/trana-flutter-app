// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_contract_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CancelContractViewModel)
final cancelContractViewModelProvider = CancelContractViewModelProvider._();

final class CancelContractViewModelProvider
    extends $NotifierProvider<CancelContractViewModel, CancelContractState> {
  CancelContractViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cancelContractViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cancelContractViewModelHash();

  @$internal
  @override
  CancelContractViewModel create() => CancelContractViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CancelContractState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CancelContractState>(value),
    );
  }
}

String _$cancelContractViewModelHash() =>
    r'15530d984d54f678b2b90921e5bccf9de3113d23';

abstract class _$CancelContractViewModel
    extends $Notifier<CancelContractState> {
  CancelContractState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CancelContractState, CancelContractState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CancelContractState, CancelContractState>,
              CancelContractState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
