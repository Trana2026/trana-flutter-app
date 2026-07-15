// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_contract_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompleteContractViewModel)
final completeContractViewModelProvider = CompleteContractViewModelProvider._();

final class CompleteContractViewModelProvider
    extends
        $NotifierProvider<CompleteContractViewModel, CompleteContractState> {
  CompleteContractViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'completeContractViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$completeContractViewModelHash();

  @$internal
  @override
  CompleteContractViewModel create() => CompleteContractViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompleteContractState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompleteContractState>(value),
    );
  }
}

String _$completeContractViewModelHash() =>
    r'ba6f914d8a9e1bd1e1923c48bc0a0d35e94823f9';

abstract class _$CompleteContractViewModel
    extends $Notifier<CompleteContractState> {
  CompleteContractState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CompleteContractState, CompleteContractState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CompleteContractState, CompleteContractState>,
              CompleteContractState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
