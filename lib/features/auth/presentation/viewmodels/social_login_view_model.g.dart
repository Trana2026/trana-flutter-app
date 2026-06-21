// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 소셜 로그인 ViewModel.
/// provider별 idToken 획득 후 서버 sign-in 하는 방식으로 진행됨

@ProviderFor(SocialLoginViewModel)
final socialLoginViewModelProvider = SocialLoginViewModelProvider._();

/// 소셜 로그인 ViewModel.
/// provider별 idToken 획득 후 서버 sign-in 하는 방식으로 진행됨
final class SocialLoginViewModelProvider
    extends $NotifierProvider<SocialLoginViewModel, void> {
  /// 소셜 로그인 ViewModel.
  /// provider별 idToken 획득 후 서버 sign-in 하는 방식으로 진행됨
  SocialLoginViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'socialLoginViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$socialLoginViewModelHash();

  @$internal
  @override
  SocialLoginViewModel create() => SocialLoginViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$socialLoginViewModelHash() =>
    r'609c445bc52075b04908b467c6c2e5a0c76f1c3c';

/// 소셜 로그인 ViewModel.
/// provider별 idToken 획득 후 서버 sign-in 하는 방식으로 진행됨

abstract class _$SocialLoginViewModel extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
