// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ContractDetailViewModel)
final contractDetailViewModelProvider = ContractDetailViewModelProvider._();

final class ContractDetailViewModelProvider
    extends $NotifierProvider<ContractDetailViewModel, ContractDetailState> {
  ContractDetailViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractDetailViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractDetailViewModelHash();

  @$internal
  @override
  ContractDetailViewModel create() => ContractDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractDetailState>(value),
    );
  }
}

String _$contractDetailViewModelHash() =>
    r'1c66e038040c485b03a02c8d65893c107061a707';

abstract class _$ContractDetailViewModel
    extends $Notifier<ContractDetailState> {
  ContractDetailState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ContractDetailState, ContractDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ContractDetailState, ContractDetailState>,
              ContractDetailState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
