// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modify_contract_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ModifyContractViewModel)
final modifyContractViewModelProvider = ModifyContractViewModelProvider._();

final class ModifyContractViewModelProvider
    extends $NotifierProvider<ModifyContractViewModel, ModifyContractState> {
  ModifyContractViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modifyContractViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modifyContractViewModelHash();

  @$internal
  @override
  ModifyContractViewModel create() => ModifyContractViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModifyContractState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModifyContractState>(value),
    );
  }
}

String _$modifyContractViewModelHash() =>
    r'05c8d8fa5f6a41f0d41f4e9763d4b76dc58b5263';

abstract class _$ModifyContractViewModel
    extends $Notifier<ModifyContractState> {
  ModifyContractState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ModifyContractState, ModifyContractState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ModifyContractState, ModifyContractState>,
              ModifyContractState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
