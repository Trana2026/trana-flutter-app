// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_auto_fill_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AiAutoFillViewModel)
final aiAutoFillViewModelProvider = AiAutoFillViewModelProvider._();

final class AiAutoFillViewModelProvider
    extends $NotifierProvider<AiAutoFillViewModel, AiAutoFillState> {
  AiAutoFillViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiAutoFillViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiAutoFillViewModelHash();

  @$internal
  @override
  AiAutoFillViewModel create() => AiAutoFillViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AiAutoFillState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AiAutoFillState>(value),
    );
  }
}

String _$aiAutoFillViewModelHash() =>
    r'b9d450fff033827660dc767662d5c2e99f81991d';

abstract class _$AiAutoFillViewModel extends $Notifier<AiAutoFillState> {
  AiAutoFillState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AiAutoFillState, AiAutoFillState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AiAutoFillState, AiAutoFillState>,
              AiAutoFillState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
