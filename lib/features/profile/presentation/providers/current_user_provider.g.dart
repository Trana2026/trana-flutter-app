// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 현재 사용자의 userId 불러오기 provider (임시, 테스트용)

@ProviderFor(CurrentUser)
final currentUserProvider = CurrentUserProvider._();

/// 현재 사용자의 userId 불러오기 provider (임시, 테스트용)
final class CurrentUserProvider extends $NotifierProvider<CurrentUser, int> {
  /// 현재 사용자의 userId 불러오기 provider (임시, 테스트용)
  CurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  CurrentUser create() => CurrentUser();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$currentUserHash() => r'733044a2a818a5d075c30f9ec8813bdd49052d1e';

/// 현재 사용자의 userId 불러오기 provider (임시, 테스트용)

abstract class _$CurrentUser extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
