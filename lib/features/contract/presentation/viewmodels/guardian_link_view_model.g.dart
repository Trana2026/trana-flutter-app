// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guardian_link_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GuardianLinkViewModel)
final guardianLinkViewModelProvider = GuardianLinkViewModelProvider._();

final class GuardianLinkViewModelProvider
    extends $NotifierProvider<GuardianLinkViewModel, GuardianLinkState> {
  GuardianLinkViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guardianLinkViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guardianLinkViewModelHash();

  @$internal
  @override
  GuardianLinkViewModel create() => GuardianLinkViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GuardianLinkState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GuardianLinkState>(value),
    );
  }
}

String _$guardianLinkViewModelHash() =>
    r'505cc7316c99d340bd70199ea092c8278f83636c';

abstract class _$GuardianLinkViewModel extends $Notifier<GuardianLinkState> {
  GuardianLinkState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<GuardianLinkState, GuardianLinkState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GuardianLinkState, GuardianLinkState>,
              GuardianLinkState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
