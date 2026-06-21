// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Dio (인증 인터셉터 = 토큰 자동부착 + 401 refresh 재시도)

@ProviderFor(dio)
final dioProvider = DioProvider._();

/// Dio (인증 인터셉터 = 토큰 자동부착 + 401 refresh 재시도)

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// Dio (인증 인터셉터 = 토큰 자동부착 + 401 refresh 재시도)
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'831184870f94e5154f9953c0d36bd27b52d8972f';

/// Native SDK 감지 서비스

@ProviderFor(ekycDetectionService)
final ekycDetectionServiceProvider = EkycDetectionServiceProvider._();

/// Native SDK 감지 서비스

final class EkycDetectionServiceProvider
    extends
        $FunctionalProvider<
          EkycDetectionService,
          EkycDetectionService,
          EkycDetectionService
        >
    with $Provider<EkycDetectionService> {
  /// Native SDK 감지 서비스
  EkycDetectionServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ekycDetectionServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ekycDetectionServiceHash();

  @$internal
  @override
  $ProviderElement<EkycDetectionService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EkycDetectionService create(Ref ref) {
    return ekycDetectionService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EkycDetectionService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EkycDetectionService>(value),
    );
  }
}

String _$ekycDetectionServiceHash() =>
    r'e7430509dfc018398d7ff2f2ba9a6c50a2a21d26';

/// 보안 저장소 (토큰 등 민감정보). 앱 세션 동안 단일 인스턴스

@ProviderFor(secureStorage)
final secureStorageProvider = SecureStorageProvider._();

/// 보안 저장소 (토큰 등 민감정보). 앱 세션 동안 단일 인스턴스

final class SecureStorageProvider
    extends
        $FunctionalProvider<
          FlutterSecureStorage,
          FlutterSecureStorage,
          FlutterSecureStorage
        >
    with $Provider<FlutterSecureStorage> {
  /// 보안 저장소 (토큰 등 민감정보). 앱 세션 동안 단일 인스턴스
  SecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageHash();

  @$internal
  @override
  $ProviderElement<FlutterSecureStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterSecureStorage create(Ref ref) {
    return secureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterSecureStorage>(value),
    );
  }
}

String _$secureStorageHash() => r'0cd1b80f91784467390034386f925a0be155bfbd';

/// 토큰 저장소 (secure storage 영속). 앱 세션 동안 단일 인스턴스

@ProviderFor(authTokenStore)
final authTokenStoreProvider = AuthTokenStoreProvider._();

/// 토큰 저장소 (secure storage 영속). 앱 세션 동안 단일 인스턴스

final class AuthTokenStoreProvider
    extends $FunctionalProvider<AuthTokenStore, AuthTokenStore, AuthTokenStore>
    with $Provider<AuthTokenStore> {
  /// 토큰 저장소 (secure storage 영속). 앱 세션 동안 단일 인스턴스
  AuthTokenStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authTokenStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authTokenStoreHash();

  @$internal
  @override
  $ProviderElement<AuthTokenStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthTokenStore create(Ref ref) {
    return authTokenStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthTokenStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthTokenStore>(value),
    );
  }
}

String _$authTokenStoreHash() => r'9c4027ba1ce68ab1d4b36044350523e1052294b3';

/// 보호자 링크 저장소 (secure storage 영속). 앱 세션 동안 단일 인스턴스

@ProviderFor(guardianLinkStore)
final guardianLinkStoreProvider = GuardianLinkStoreProvider._();

/// 보호자 링크 저장소 (secure storage 영속). 앱 세션 동안 단일 인스턴스

final class GuardianLinkStoreProvider
    extends
        $FunctionalProvider<
          GuardianLinkStore,
          GuardianLinkStore,
          GuardianLinkStore
        >
    with $Provider<GuardianLinkStore> {
  /// 보호자 링크 저장소 (secure storage 영속). 앱 세션 동안 단일 인스턴스
  GuardianLinkStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guardianLinkStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guardianLinkStoreHash();

  @$internal
  @override
  $ProviderElement<GuardianLinkStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GuardianLinkStore create(Ref ref) {
    return guardianLinkStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GuardianLinkStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GuardianLinkStore>(value),
    );
  }
}

String _$guardianLinkStoreHash() => r'24906f2a6e5d83e7d94297f700cff06a0823481f';

/// AuthRepository

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

/// AuthRepository

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  /// AuthRepository
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'dfb917a58f679e16137758260215926b7f72e970';

/// EkycRepository

@ProviderFor(ekycRepository)
final ekycRepositoryProvider = EkycRepositoryProvider._();

/// EkycRepository

final class EkycRepositoryProvider
    extends $FunctionalProvider<EkycRepository, EkycRepository, EkycRepository>
    with $Provider<EkycRepository> {
  /// EkycRepository
  EkycRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ekycRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ekycRepositoryHash();

  @$internal
  @override
  $ProviderElement<EkycRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EkycRepository create(Ref ref) {
    return ekycRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EkycRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EkycRepository>(value),
    );
  }
}

String _$ekycRepositoryHash() => r'5f758bf717614ccf1b03faf1a1651612beb86b03';

/// GuardianRepository

@ProviderFor(guardianRepository)
final guardianRepositoryProvider = GuardianRepositoryProvider._();

/// GuardianRepository

final class GuardianRepositoryProvider
    extends
        $FunctionalProvider<
          GuardianRepository,
          GuardianRepository,
          GuardianRepository
        >
    with $Provider<GuardianRepository> {
  /// GuardianRepository
  GuardianRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guardianRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guardianRepositoryHash();

  @$internal
  @override
  $ProviderElement<GuardianRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GuardianRepository create(Ref ref) {
    return guardianRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GuardianRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GuardianRepository>(value),
    );
  }
}

String _$guardianRepositoryHash() =>
    r'06bd4e423053c50c64b7de0fa4356c7a0843375f';

/// 소셜 로그인 UseCase

@ProviderFor(socialSignInUseCase)
final socialSignInUseCaseProvider = SocialSignInUseCaseProvider._();

/// 소셜 로그인 UseCase

final class SocialSignInUseCaseProvider
    extends
        $FunctionalProvider<
          SocialSignInUseCase,
          SocialSignInUseCase,
          SocialSignInUseCase
        >
    with $Provider<SocialSignInUseCase> {
  /// 소셜 로그인 UseCase
  SocialSignInUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'socialSignInUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$socialSignInUseCaseHash();

  @$internal
  @override
  $ProviderElement<SocialSignInUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SocialSignInUseCase create(Ref ref) {
    return socialSignInUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SocialSignInUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SocialSignInUseCase>(value),
    );
  }
}

String _$socialSignInUseCaseHash() =>
    r'7507677934c6bdc1bcdcefb68254f2323be2e05d';
