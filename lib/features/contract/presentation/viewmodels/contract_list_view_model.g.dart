// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ContractListNotifier)
final contractListProvider = ContractListNotifierProvider._();

final class ContractListNotifierProvider
    extends $NotifierProvider<ContractListNotifier, List<ContractEntity>> {
  ContractListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractListNotifierHash();

  @$internal
  @override
  ContractListNotifier create() => ContractListNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ContractEntity> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ContractEntity>>(value),
    );
  }
}

String _$contractListNotifierHash() =>
    r'117535da995891b398df3b64be8d30658fc1e0e5';

abstract class _$ContractListNotifier extends $Notifier<List<ContractEntity>> {
  List<ContractEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<ContractEntity>, List<ContractEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<ContractEntity>, List<ContractEntity>>,
              List<ContractEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
