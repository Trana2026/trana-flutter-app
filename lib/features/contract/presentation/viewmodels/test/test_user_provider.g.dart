// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TestUser)
final testUserProvider = TestUserProvider._();

final class TestUserProvider
    extends $NotifierProvider<TestUser, TestUserEntity?> {
  TestUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'testUserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$testUserHash();

  @$internal
  @override
  TestUser create() => TestUser();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TestUserEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TestUserEntity?>(value),
    );
  }
}

String _$testUserHash() => r'f822ed2940c3d984fe79e996fd73586e7a7045cc';

abstract class _$TestUser extends $Notifier<TestUserEntity?> {
  TestUserEntity? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TestUserEntity?, TestUserEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TestUserEntity?, TestUserEntity?>,
              TestUserEntity?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
