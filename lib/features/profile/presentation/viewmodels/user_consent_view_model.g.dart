// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_consent_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserConsentViewModel)
final userConsentViewModelProvider = UserConsentViewModelProvider._();

final class UserConsentViewModelProvider
    extends $NotifierProvider<UserConsentViewModel, UserConsentState> {
  UserConsentViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userConsentViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userConsentViewModelHash();

  @$internal
  @override
  UserConsentViewModel create() => UserConsentViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserConsentState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserConsentState>(value),
    );
  }
}

String _$userConsentViewModelHash() =>
    r'9d9c2a0fefa422e1b2b4489e49c677cefd6e56d2';

abstract class _$UserConsentViewModel extends $Notifier<UserConsentState> {
  UserConsentState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UserConsentState, UserConsentState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserConsentState, UserConsentState>,
              UserConsentState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
