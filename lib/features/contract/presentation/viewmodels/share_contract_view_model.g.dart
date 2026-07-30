// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_contract_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShareContractViewModel)
final shareContractViewModelProvider = ShareContractViewModelProvider._();

final class ShareContractViewModelProvider
    extends $NotifierProvider<ShareContractViewModel, ShareContractState> {
  ShareContractViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shareContractViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shareContractViewModelHash();

  @$internal
  @override
  ShareContractViewModel create() => ShareContractViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShareContractState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShareContractState>(value),
    );
  }
}

String _$shareContractViewModelHash() =>
    r'736ce5a20a3274e1af8e2e7c8b2a189f8db732ec';

abstract class _$ShareContractViewModel extends $Notifier<ShareContractState> {
  ShareContractState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ShareContractState, ShareContractState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ShareContractState, ShareContractState>,
              ShareContractState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
