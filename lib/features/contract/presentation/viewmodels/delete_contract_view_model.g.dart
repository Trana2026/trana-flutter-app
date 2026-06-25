// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_contract_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeleteContractViewModel)
final deleteContractViewModelProvider = DeleteContractViewModelProvider._();

final class DeleteContractViewModelProvider
    extends $NotifierProvider<DeleteContractViewModel, DeleteContractState> {
  DeleteContractViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteContractViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteContractViewModelHash();

  @$internal
  @override
  DeleteContractViewModel create() => DeleteContractViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteContractState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteContractState>(value),
    );
  }
}

String _$deleteContractViewModelHash() =>
    r'5087db01cd1246e51922783f9f7572d991cb3482';

abstract class _$DeleteContractViewModel
    extends $Notifier<DeleteContractState> {
  DeleteContractState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DeleteContractState, DeleteContractState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DeleteContractState, DeleteContractState>,
              DeleteContractState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
