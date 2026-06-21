// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 로그인 상태 및 인증 관련 ViewModel

@ProviderFor(AuthViewModel)
final authViewModelProvider = AuthViewModelProvider._();

/// 로그인 상태 및 인증 관련 ViewModel
final class AuthViewModelProvider
    extends $AsyncNotifierProvider<AuthViewModel, UserEntity?> {
  /// 로그인 상태 및 인증 관련 ViewModel
  AuthViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authViewModelHash();

  @$internal
  @override
  AuthViewModel create() => AuthViewModel();
}

String _$authViewModelHash() => r'94b34f21a1f6bc4d75739d84a58445c176ecbe7e';

/// 로그인 상태 및 인증 관련 ViewModel

abstract class _$AuthViewModel extends $AsyncNotifier<UserEntity?> {
  FutureOr<UserEntity?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserEntity?>, UserEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserEntity?>, UserEntity?>,
              AsyncValue<UserEntity?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
