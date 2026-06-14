// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contract_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreateContractViewModel)
final createContractViewModelProvider = CreateContractViewModelProvider._();

final class CreateContractViewModelProvider
    extends $NotifierProvider<CreateContractViewModel, CreateContractState> {
  CreateContractViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createContractViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createContractViewModelHash();

  @$internal
  @override
  CreateContractViewModel create() => CreateContractViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateContractState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateContractState>(value),
    );
  }
}

String _$createContractViewModelHash() =>
    r'638eda0c4576b67a85e88e999577c82b8a8cc44b';

abstract class _$CreateContractViewModel
    extends $Notifier<CreateContractState> {
  CreateContractState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CreateContractState, CreateContractState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CreateContractState, CreateContractState>,
              CreateContractState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
