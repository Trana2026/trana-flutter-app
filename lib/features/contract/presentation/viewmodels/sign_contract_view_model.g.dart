// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_contract_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SignContractViewModel)
final signContractViewModelProvider = SignContractViewModelProvider._();

final class SignContractViewModelProvider
    extends $NotifierProvider<SignContractViewModel, SignContractState> {
  SignContractViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signContractViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signContractViewModelHash();

  @$internal
  @override
  SignContractViewModel create() => SignContractViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignContractState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignContractState>(value),
    );
  }
}

String _$signContractViewModelHash() =>
    r'f27a1c5300172dd70bcf007480d70b4f97edfe46';

abstract class _$SignContractViewModel extends $Notifier<SignContractState> {
  SignContractState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SignContractState, SignContractState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignContractState, SignContractState>,
              SignContractState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
