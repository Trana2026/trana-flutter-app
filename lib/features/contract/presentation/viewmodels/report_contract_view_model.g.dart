// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_contract_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReportContractViewModel)
final reportContractViewModelProvider = ReportContractViewModelProvider._();

final class ReportContractViewModelProvider
    extends $NotifierProvider<ReportContractViewModel, ReportContractState> {
  ReportContractViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportContractViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportContractViewModelHash();

  @$internal
  @override
  ReportContractViewModel create() => ReportContractViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportContractState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportContractState>(value),
    );
  }
}

String _$reportContractViewModelHash() =>
    r'31b8bb8a104ee0170650c1222531bf801b02483e';

abstract class _$ReportContractViewModel
    extends $Notifier<ReportContractState> {
  ReportContractState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ReportContractState, ReportContractState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReportContractState, ReportContractState>,
              ReportContractState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
