// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_contract_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReceiveContractViewModel)
final receiveContractViewModelProvider = ReceiveContractViewModelProvider._();

final class ReceiveContractViewModelProvider
    extends $NotifierProvider<ReceiveContractViewModel, ReceiveContractState> {
  ReceiveContractViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'receiveContractViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$receiveContractViewModelHash();

  @$internal
  @override
  ReceiveContractViewModel create() => ReceiveContractViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReceiveContractState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReceiveContractState>(value),
    );
  }
}

String _$receiveContractViewModelHash() =>
    r'2bf75bf3a9de0d742bdc4f9b1da8c806386833e0';

abstract class _$ReceiveContractViewModel
    extends $Notifier<ReceiveContractState> {
  ReceiveContractState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ReceiveContractState, ReceiveContractState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReceiveContractState, ReceiveContractState>,
              ReceiveContractState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
