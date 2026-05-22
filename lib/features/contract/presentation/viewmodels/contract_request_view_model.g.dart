// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_request_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ContractRequestViewModel)
final contractRequestViewModelProvider = ContractRequestViewModelProvider._();

final class ContractRequestViewModelProvider
    extends $NotifierProvider<ContractRequestViewModel, ContractRequestState> {
  ContractRequestViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractRequestViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractRequestViewModelHash();

  @$internal
  @override
  ContractRequestViewModel create() => ContractRequestViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractRequestState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractRequestState>(value),
    );
  }
}

String _$contractRequestViewModelHash() =>
    r'59c99db5271821b56266406f2b09ad850f4a6ca6';

abstract class _$ContractRequestViewModel
    extends $Notifier<ContractRequestState> {
  ContractRequestState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ContractRequestState, ContractRequestState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ContractRequestState, ContractRequestState>,
              ContractRequestState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
