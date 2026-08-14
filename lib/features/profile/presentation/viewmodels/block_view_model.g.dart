// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BlockViewModel)
final blockViewModelProvider = BlockViewModelProvider._();

final class BlockViewModelProvider
    extends $NotifierProvider<BlockViewModel, BlockState> {
  BlockViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'blockViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$blockViewModelHash();

  @$internal
  @override
  BlockViewModel create() => BlockViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BlockState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BlockState>(value),
    );
  }
}

String _$blockViewModelHash() => r'4246b250c86bbac02dd43e8f70dbdaa6be541438';

abstract class _$BlockViewModel extends $Notifier<BlockState> {
  BlockState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<BlockState, BlockState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BlockState, BlockState>,
              BlockState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
