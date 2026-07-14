// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 보안 저장소

@ProviderFor(secureStorage)
final secureStorageProvider = SecureStorageProvider._();

/// 보안 저장소

final class SecureStorageProvider
    extends
        $FunctionalProvider<
          FlutterSecureStorage,
          FlutterSecureStorage,
          FlutterSecureStorage
        >
    with $Provider<FlutterSecureStorage> {
  /// 보안 저장소
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

String _$secureStorageHash() => r'a4f75721472cf77465bf47f759c90de5ca30856e';

/// 인증 토큰 저장소

@ProviderFor(authTokenStore)
final authTokenStoreProvider = AuthTokenStoreProvider._();

/// 인증 토큰 저장소

final class AuthTokenStoreProvider
    extends $FunctionalProvider<AuthTokenStore, AuthTokenStore, AuthTokenStore>
    with $Provider<AuthTokenStore> {
  /// 인증 토큰 저장소
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

String _$authTokenStoreHash() => r'9c832bc3bddaa58855b087c358fe88f9570249b4';

/// 대리인 인증 링크 저장소

@ProviderFor(guardianLinkStore)
final guardianLinkStoreProvider = GuardianLinkStoreProvider._();

/// 대리인 인증 링크 저장소

final class GuardianLinkStoreProvider
    extends
        $FunctionalProvider<
          GuardianLinkStore,
          GuardianLinkStore,
          GuardianLinkStore
        >
    with $Provider<GuardianLinkStore> {
  /// 대리인 인증 링크 저장소
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

String _$guardianLinkStoreHash() => r'b28b3829d4b6043e2e2c30eb4144a06436752d84';

/// 인증 및 토큰 갱신 인터셉터가 적용된 Dio

@ProviderFor(dio)
final dioProvider = DioProvider._();

/// 인증 및 토큰 갱신 인터셉터가 적용된 Dio

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// 인증 및 토큰 갱신 인터셉터가 적용된 Dio
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

String _$dioHash() => r'0c4b161246e27dfaad7d85f794fa0f4f45464ffc';

/// S3 업로드 전용 Dio

@ProviderFor(s3Dio)
final s3DioProvider = S3DioProvider._();

/// S3 업로드 전용 Dio

final class S3DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// S3 업로드 전용 Dio
  S3DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r's3DioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$s3DioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return s3Dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$s3DioHash() => r'fa29615182f6a02e2a5e4e837dafd51b56b0080e';

/// eKYC Native SDK 감지 서비스

@ProviderFor(ekycDetectionService)
final ekycDetectionServiceProvider = EkycDetectionServiceProvider._();

/// eKYC Native SDK 감지 서비스

final class EkycDetectionServiceProvider
    extends
        $FunctionalProvider<
          EkycDetectionService,
          EkycDetectionService,
          EkycDetectionService
        >
    with $Provider<EkycDetectionService> {
  /// eKYC Native SDK 감지 서비스
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
    r'8908f9bbc4b25a77659b805302f8db6ad7252e8f';

@ProviderFor(contractDraftDataSource)
final contractDraftDataSourceProvider = ContractDraftDataSourceProvider._();

final class ContractDraftDataSourceProvider
    extends
        $FunctionalProvider<
          ContractDraftDataSource,
          ContractDraftDataSource,
          ContractDraftDataSource
        >
    with $Provider<ContractDraftDataSource> {
  ContractDraftDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractDraftDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractDraftDataSourceHash();

  @$internal
  @override
  $ProviderElement<ContractDraftDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractDraftDataSource create(Ref ref) {
    return contractDraftDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractDraftDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractDraftDataSource>(value),
    );
  }
}

String _$contractDraftDataSourceHash() =>
    r'c2178c99330e4420d1c1c9278b3b45c2f17f9cfa';

@ProviderFor(contractAttachmentDataSource)
final contractAttachmentDataSourceProvider =
    ContractAttachmentDataSourceProvider._();

final class ContractAttachmentDataSourceProvider
    extends
        $FunctionalProvider<
          ContractAttachmentDataSource,
          ContractAttachmentDataSource,
          ContractAttachmentDataSource
        >
    with $Provider<ContractAttachmentDataSource> {
  ContractAttachmentDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractAttachmentDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractAttachmentDataSourceHash();

  @$internal
  @override
  $ProviderElement<ContractAttachmentDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractAttachmentDataSource create(Ref ref) {
    return contractAttachmentDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractAttachmentDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractAttachmentDataSource>(value),
    );
  }
}

String _$contractAttachmentDataSourceHash() =>
    r'721cfad26944075250debb7b3848a9dc1d7c68c0';

@ProviderFor(contractS3DataSource)
final contractS3DataSourceProvider = ContractS3DataSourceProvider._();

final class ContractS3DataSourceProvider
    extends
        $FunctionalProvider<
          ContractS3DataSource,
          ContractS3DataSource,
          ContractS3DataSource
        >
    with $Provider<ContractS3DataSource> {
  ContractS3DataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractS3DataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractS3DataSourceHash();

  @$internal
  @override
  $ProviderElement<ContractS3DataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractS3DataSource create(Ref ref) {
    return contractS3DataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractS3DataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractS3DataSource>(value),
    );
  }
}

String _$contractS3DataSourceHash() =>
    r'df166d8db0d7dbfc26ea9541303d802d337e4bd7';

@ProviderFor(contractAiExtractionDataSource)
final contractAiExtractionDataSourceProvider =
    ContractAiExtractionDataSourceProvider._();

final class ContractAiExtractionDataSourceProvider
    extends
        $FunctionalProvider<
          ContractAiExtractionDataSource,
          ContractAiExtractionDataSource,
          ContractAiExtractionDataSource
        >
    with $Provider<ContractAiExtractionDataSource> {
  ContractAiExtractionDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractAiExtractionDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractAiExtractionDataSourceHash();

  @$internal
  @override
  $ProviderElement<ContractAiExtractionDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractAiExtractionDataSource create(Ref ref) {
    return contractAiExtractionDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractAiExtractionDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractAiExtractionDataSource>(
        value,
      ),
    );
  }
}

String _$contractAiExtractionDataSourceHash() =>
    r'e955027d4b4cb4f703c2450a78ba305de259c0fd';

@ProviderFor(contractGuardianConsentDataSource)
final contractGuardianConsentDataSourceProvider =
    ContractGuardianConsentDataSourceProvider._();

final class ContractGuardianConsentDataSourceProvider
    extends
        $FunctionalProvider<
          ContractGuardianConsentDataSource,
          ContractGuardianConsentDataSource,
          ContractGuardianConsentDataSource
        >
    with $Provider<ContractGuardianConsentDataSource> {
  ContractGuardianConsentDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractGuardianConsentDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$contractGuardianConsentDataSourceHash();

  @$internal
  @override
  $ProviderElement<ContractGuardianConsentDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractGuardianConsentDataSource create(Ref ref) {
    return contractGuardianConsentDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractGuardianConsentDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractGuardianConsentDataSource>(
        value,
      ),
    );
  }
}

String _$contractGuardianConsentDataSourceHash() =>
    r'766261e38c8a36169de4971a46748bedce830580';

@ProviderFor(contractInvitationDataSource)
final contractInvitationDataSourceProvider =
    ContractInvitationDataSourceProvider._();

final class ContractInvitationDataSourceProvider
    extends
        $FunctionalProvider<
          ContractInvitationDataSource,
          ContractInvitationDataSource,
          ContractInvitationDataSource
        >
    with $Provider<ContractInvitationDataSource> {
  ContractInvitationDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractInvitationDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractInvitationDataSourceHash();

  @$internal
  @override
  $ProviderElement<ContractInvitationDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractInvitationDataSource create(Ref ref) {
    return contractInvitationDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractInvitationDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractInvitationDataSource>(value),
    );
  }
}

String _$contractInvitationDataSourceHash() =>
    r'45babf36f9259a6154bebef5cf3f0fb83dae4d7f';

@ProviderFor(contractCancellationDataSource)
final contractCancellationDataSourceProvider =
    ContractCancellationDataSourceProvider._();

final class ContractCancellationDataSourceProvider
    extends
        $FunctionalProvider<
          ContractCancellationDataSource,
          ContractCancellationDataSource,
          ContractCancellationDataSource
        >
    with $Provider<ContractCancellationDataSource> {
  ContractCancellationDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractCancellationDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractCancellationDataSourceHash();

  @$internal
  @override
  $ProviderElement<ContractCancellationDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractCancellationDataSource create(Ref ref) {
    return contractCancellationDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractCancellationDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractCancellationDataSource>(
        value,
      ),
    );
  }
}

String _$contractCancellationDataSourceHash() =>
    r'e22b5f45e6e8049c12dbee64c1a30c5e68d8632d';

@ProviderFor(contractDisputeDataSource)
final contractDisputeDataSourceProvider = ContractDisputeDataSourceProvider._();

final class ContractDisputeDataSourceProvider
    extends
        $FunctionalProvider<
          ContractDisputeDataSource,
          ContractDisputeDataSource,
          ContractDisputeDataSource
        >
    with $Provider<ContractDisputeDataSource> {
  ContractDisputeDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractDisputeDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractDisputeDataSourceHash();

  @$internal
  @override
  $ProviderElement<ContractDisputeDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractDisputeDataSource create(Ref ref) {
    return contractDisputeDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractDisputeDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractDisputeDataSource>(value),
    );
  }
}

String _$contractDisputeDataSourceHash() =>
    r'187bc6d4269d843d5ee1be30a0fa8c4b4fd08623';

@ProviderFor(contractLifecycleDataSource)
final contractLifecycleDataSourceProvider =
    ContractLifecycleDataSourceProvider._();

final class ContractLifecycleDataSourceProvider
    extends
        $FunctionalProvider<
          ContractLifecycleDataSource,
          ContractLifecycleDataSource,
          ContractLifecycleDataSource
        >
    with $Provider<ContractLifecycleDataSource> {
  ContractLifecycleDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractLifecycleDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractLifecycleDataSourceHash();

  @$internal
  @override
  $ProviderElement<ContractLifecycleDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractLifecycleDataSource create(Ref ref) {
    return contractLifecycleDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractLifecycleDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractLifecycleDataSource>(value),
    );
  }
}

String _$contractLifecycleDataSourceHash() =>
    r'39e2a32caeb838262c3fb0751c6fe6d367551987';

@ProviderFor(contractPdfDataSource)
final contractPdfDataSourceProvider = ContractPdfDataSourceProvider._();

final class ContractPdfDataSourceProvider
    extends
        $FunctionalProvider<
          ContractPdfDataSource,
          ContractPdfDataSource,
          ContractPdfDataSource
        >
    with $Provider<ContractPdfDataSource> {
  ContractPdfDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractPdfDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractPdfDataSourceHash();

  @$internal
  @override
  $ProviderElement<ContractPdfDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractPdfDataSource create(Ref ref) {
    return contractPdfDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractPdfDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractPdfDataSource>(value),
    );
  }
}

String _$contractPdfDataSourceHash() =>
    r'5451aa6ad072b052ff7f4747381a75b7b331a4e2';

@ProviderFor(deviceTokenDataSource)
final deviceTokenDataSourceProvider = DeviceTokenDataSourceProvider._();

final class DeviceTokenDataSourceProvider
    extends
        $FunctionalProvider<
          DeviceTokenDataSource,
          DeviceTokenDataSource,
          DeviceTokenDataSource
        >
    with $Provider<DeviceTokenDataSource> {
  DeviceTokenDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceTokenDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceTokenDataSourceHash();

  @$internal
  @override
  $ProviderElement<DeviceTokenDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeviceTokenDataSource create(Ref ref) {
    return deviceTokenDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceTokenDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceTokenDataSource>(value),
    );
  }
}

String _$deviceTokenDataSourceHash() =>
    r'5cc420f63cd6d45804df0149013e423a243898ea';

@ProviderFor(notificationDataSource)
final notificationDataSourceProvider = NotificationDataSourceProvider._();

final class NotificationDataSourceProvider
    extends
        $FunctionalProvider<
          NotificationDataSource,
          NotificationDataSource,
          NotificationDataSource
        >
    with $Provider<NotificationDataSource> {
  NotificationDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationDataSourceHash();

  @$internal
  @override
  $ProviderElement<NotificationDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationDataSource create(Ref ref) {
    return notificationDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationDataSource>(value),
    );
  }
}

String _$notificationDataSourceHash() =>
    r'801834306c61780acb855f0e2e48e0d60ca7d78a';

@ProviderFor(trustScoreDataSource)
final trustScoreDataSourceProvider = TrustScoreDataSourceProvider._();

final class TrustScoreDataSourceProvider
    extends
        $FunctionalProvider<
          TrustScoreDataSource,
          TrustScoreDataSource,
          TrustScoreDataSource
        >
    with $Provider<TrustScoreDataSource> {
  TrustScoreDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trustScoreDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trustScoreDataSourceHash();

  @$internal
  @override
  $ProviderElement<TrustScoreDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TrustScoreDataSource create(Ref ref) {
    return trustScoreDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrustScoreDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrustScoreDataSource>(value),
    );
  }
}

String _$trustScoreDataSourceHash() =>
    r'293ee9c36d7dd31339d69cab5cb38f145316af71';

@ProviderFor(userConsentDataSource)
final userConsentDataSourceProvider = UserConsentDataSourceProvider._();

final class UserConsentDataSourceProvider
    extends
        $FunctionalProvider<
          UserConsentDataSource,
          UserConsentDataSource,
          UserConsentDataSource
        >
    with $Provider<UserConsentDataSource> {
  UserConsentDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userConsentDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userConsentDataSourceHash();

  @$internal
  @override
  $ProviderElement<UserConsentDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserConsentDataSource create(Ref ref) {
    return userConsentDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserConsentDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserConsentDataSource>(value),
    );
  }
}

String _$userConsentDataSourceHash() =>
    r'90f523c3429b9652e12301eb8ee607050a72f64e';

@ProviderFor(userInfoDataSource)
final userInfoDataSourceProvider = UserInfoDataSourceProvider._();

final class UserInfoDataSourceProvider
    extends
        $FunctionalProvider<
          UserInfoDataSource,
          UserInfoDataSource,
          UserInfoDataSource
        >
    with $Provider<UserInfoDataSource> {
  UserInfoDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userInfoDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userInfoDataSourceHash();

  @$internal
  @override
  $ProviderElement<UserInfoDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserInfoDataSource create(Ref ref) {
    return userInfoDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserInfoDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserInfoDataSource>(value),
    );
  }
}

String _$userInfoDataSourceHash() =>
    r'ee82c65422647315ea19a91f84d61c7f2f17a0eb';

@ProviderFor(userInquiryDataSource)
final userInquiryDataSourceProvider = UserInquiryDataSourceProvider._();

final class UserInquiryDataSourceProvider
    extends
        $FunctionalProvider<
          UserInquiryDataSource,
          UserInquiryDataSource,
          UserInquiryDataSource
        >
    with $Provider<UserInquiryDataSource> {
  UserInquiryDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userInquiryDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userInquiryDataSourceHash();

  @$internal
  @override
  $ProviderElement<UserInquiryDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserInquiryDataSource create(Ref ref) {
    return userInquiryDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserInquiryDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserInquiryDataSource>(value),
    );
  }
}

String _$userInquiryDataSourceHash() =>
    r'2fb485f34150f4c73b2bb5920eca233d742fe322';

@ProviderFor(userPreferenceDataSource)
final userPreferenceDataSourceProvider = UserPreferenceDataSourceProvider._();

final class UserPreferenceDataSourceProvider
    extends
        $FunctionalProvider<
          UserPreferenceDataSource,
          UserPreferenceDataSource,
          UserPreferenceDataSource
        >
    with $Provider<UserPreferenceDataSource> {
  UserPreferenceDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userPreferenceDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userPreferenceDataSourceHash();

  @$internal
  @override
  $ProviderElement<UserPreferenceDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserPreferenceDataSource create(Ref ref) {
    return userPreferenceDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserPreferenceDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserPreferenceDataSource>(value),
    );
  }
}

String _$userPreferenceDataSourceHash() =>
    r'a8d057446cb7fbe607c5f0275d94ae0d4a1e4297';

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
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

String _$authRepositoryHash() => r'7d8a0cf0c2711df29848880d792e7d826515c6f6';

@ProviderFor(passAuthRepository)
final passAuthRepositoryProvider = PassAuthRepositoryProvider._();

final class PassAuthRepositoryProvider
    extends
        $FunctionalProvider<
          PassAuthRepository,
          PassAuthRepository,
          PassAuthRepository
        >
    with $Provider<PassAuthRepository> {
  PassAuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passAuthRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passAuthRepositoryHash();

  @$internal
  @override
  $ProviderElement<PassAuthRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PassAuthRepository create(Ref ref) {
    return passAuthRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PassAuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PassAuthRepository>(value),
    );
  }
}

String _$passAuthRepositoryHash() =>
    r'65354d03f619241c1b9395a4c81c92877c1d0de9';

@ProviderFor(ekycRepository)
final ekycRepositoryProvider = EkycRepositoryProvider._();

final class EkycRepositoryProvider
    extends $FunctionalProvider<EkycRepository, EkycRepository, EkycRepository>
    with $Provider<EkycRepository> {
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

String _$ekycRepositoryHash() => r'25833c1b2065bad30ba47ef02507cc5d6eac1891';

@ProviderFor(guardianRepository)
final guardianRepositoryProvider = GuardianRepositoryProvider._();

final class GuardianRepositoryProvider
    extends
        $FunctionalProvider<
          GuardianRepository,
          GuardianRepository,
          GuardianRepository
        >
    with $Provider<GuardianRepository> {
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
    r'53d0c0dc7619187e5544b8032a1ba887912c969f';

@ProviderFor(userRepository)
final userRepositoryProvider = UserRepositoryProvider._();

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'a396287575028955d8dde651538babe943491c89';

@ProviderFor(contractRepository)
final contractRepositoryProvider = ContractRepositoryProvider._();

final class ContractRepositoryProvider
    extends
        $FunctionalProvider<
          ContractRepository,
          ContractRepository,
          ContractRepository
        >
    with $Provider<ContractRepository> {
  ContractRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractRepositoryHash();

  @$internal
  @override
  $ProviderElement<ContractRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractRepository create(Ref ref) {
    return contractRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractRepository>(value),
    );
  }
}

String _$contractRepositoryHash() =>
    r'b2fa4c60c9b1c5537e6a95d71cb3390dae902aa5';

@ProviderFor(contractDraftRepository)
final contractDraftRepositoryProvider = ContractDraftRepositoryProvider._();

final class ContractDraftRepositoryProvider
    extends
        $FunctionalProvider<
          ContractDraftRepository,
          ContractDraftRepository,
          ContractDraftRepository
        >
    with $Provider<ContractDraftRepository> {
  ContractDraftRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractDraftRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractDraftRepositoryHash();

  @$internal
  @override
  $ProviderElement<ContractDraftRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractDraftRepository create(Ref ref) {
    return contractDraftRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractDraftRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractDraftRepository>(value),
    );
  }
}

String _$contractDraftRepositoryHash() =>
    r'4c1d6d2ee7103272e2eecc6a259332e9750c2d2f';

@ProviderFor(contractAttachmentRepository)
final contractAttachmentRepositoryProvider =
    ContractAttachmentRepositoryProvider._();

final class ContractAttachmentRepositoryProvider
    extends
        $FunctionalProvider<
          ContractAttachmentRepository,
          ContractAttachmentRepository,
          ContractAttachmentRepository
        >
    with $Provider<ContractAttachmentRepository> {
  ContractAttachmentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractAttachmentRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractAttachmentRepositoryHash();

  @$internal
  @override
  $ProviderElement<ContractAttachmentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractAttachmentRepository create(Ref ref) {
    return contractAttachmentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractAttachmentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractAttachmentRepository>(value),
    );
  }
}

String _$contractAttachmentRepositoryHash() =>
    r'26bb381be934c99480d0dabcea5ab88779230410';

@ProviderFor(contractAiExtractionRepository)
final contractAiExtractionRepositoryProvider =
    ContractAiExtractionRepositoryProvider._();

final class ContractAiExtractionRepositoryProvider
    extends
        $FunctionalProvider<
          ContractAiExtractionRepository,
          ContractAiExtractionRepository,
          ContractAiExtractionRepository
        >
    with $Provider<ContractAiExtractionRepository> {
  ContractAiExtractionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractAiExtractionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractAiExtractionRepositoryHash();

  @$internal
  @override
  $ProviderElement<ContractAiExtractionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractAiExtractionRepository create(Ref ref) {
    return contractAiExtractionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractAiExtractionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractAiExtractionRepository>(
        value,
      ),
    );
  }
}

String _$contractAiExtractionRepositoryHash() =>
    r'5f1930102b3edac6b77d831730eb74a717b84c41';

@ProviderFor(contractGuardianConsentRepository)
final contractGuardianConsentRepositoryProvider =
    ContractGuardianConsentRepositoryProvider._();

final class ContractGuardianConsentRepositoryProvider
    extends
        $FunctionalProvider<
          ContractGuardianConsentRepository,
          ContractGuardianConsentRepository,
          ContractGuardianConsentRepository
        >
    with $Provider<ContractGuardianConsentRepository> {
  ContractGuardianConsentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractGuardianConsentRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$contractGuardianConsentRepositoryHash();

  @$internal
  @override
  $ProviderElement<ContractGuardianConsentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractGuardianConsentRepository create(Ref ref) {
    return contractGuardianConsentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractGuardianConsentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractGuardianConsentRepository>(
        value,
      ),
    );
  }
}

String _$contractGuardianConsentRepositoryHash() =>
    r'92038a15ee76c736c741937a868ed3082d537aa2';

@ProviderFor(contractInvitationRepository)
final contractInvitationRepositoryProvider =
    ContractInvitationRepositoryProvider._();

final class ContractInvitationRepositoryProvider
    extends
        $FunctionalProvider<
          ContractInvitationRepository,
          ContractInvitationRepository,
          ContractInvitationRepository
        >
    with $Provider<ContractInvitationRepository> {
  ContractInvitationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractInvitationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractInvitationRepositoryHash();

  @$internal
  @override
  $ProviderElement<ContractInvitationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractInvitationRepository create(Ref ref) {
    return contractInvitationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractInvitationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractInvitationRepository>(value),
    );
  }
}

String _$contractInvitationRepositoryHash() =>
    r'0a2f31abf0f7f7008dc1d3894d6dd1a6cf555cd0';

@ProviderFor(contractCancellationRepository)
final contractCancellationRepositoryProvider =
    ContractCancellationRepositoryProvider._();

final class ContractCancellationRepositoryProvider
    extends
        $FunctionalProvider<
          ContractCancellationRepository,
          ContractCancellationRepository,
          ContractCancellationRepository
        >
    with $Provider<ContractCancellationRepository> {
  ContractCancellationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractCancellationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractCancellationRepositoryHash();

  @$internal
  @override
  $ProviderElement<ContractCancellationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractCancellationRepository create(Ref ref) {
    return contractCancellationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractCancellationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractCancellationRepository>(
        value,
      ),
    );
  }
}

String _$contractCancellationRepositoryHash() =>
    r'c403ee2c66fe771e08a03f454d8fdcaa384dd37d';

@ProviderFor(contractDisputeRepository)
final contractDisputeRepositoryProvider = ContractDisputeRepositoryProvider._();

final class ContractDisputeRepositoryProvider
    extends
        $FunctionalProvider<
          ContractDisputeRepository,
          ContractDisputeRepository,
          ContractDisputeRepository
        >
    with $Provider<ContractDisputeRepository> {
  ContractDisputeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractDisputeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractDisputeRepositoryHash();

  @$internal
  @override
  $ProviderElement<ContractDisputeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractDisputeRepository create(Ref ref) {
    return contractDisputeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractDisputeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractDisputeRepository>(value),
    );
  }
}

String _$contractDisputeRepositoryHash() =>
    r'9183d051dab3223715be9c2101956ed4cfc24f92';

@ProviderFor(contractLifecycleRepository)
final contractLifecycleRepositoryProvider =
    ContractLifecycleRepositoryProvider._();

final class ContractLifecycleRepositoryProvider
    extends
        $FunctionalProvider<
          ContractLifecycleRepository,
          ContractLifecycleRepository,
          ContractLifecycleRepository
        >
    with $Provider<ContractLifecycleRepository> {
  ContractLifecycleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractLifecycleRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractLifecycleRepositoryHash();

  @$internal
  @override
  $ProviderElement<ContractLifecycleRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractLifecycleRepository create(Ref ref) {
    return contractLifecycleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractLifecycleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractLifecycleRepository>(value),
    );
  }
}

String _$contractLifecycleRepositoryHash() =>
    r'c5ae203aedc1152970e3c590daf93f72278560e8';

@ProviderFor(contractPdfRepository)
final contractPdfRepositoryProvider = ContractPdfRepositoryProvider._();

final class ContractPdfRepositoryProvider
    extends
        $FunctionalProvider<
          ContractPdfRepository,
          ContractPdfRepository,
          ContractPdfRepository
        >
    with $Provider<ContractPdfRepository> {
  ContractPdfRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contractPdfRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contractPdfRepositoryHash();

  @$internal
  @override
  $ProviderElement<ContractPdfRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContractPdfRepository create(Ref ref) {
    return contractPdfRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractPdfRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractPdfRepository>(value),
    );
  }
}

String _$contractPdfRepositoryHash() =>
    r'689fc95eae58260289ff671b05485c932446946f';

@ProviderFor(deviceTokenRepository)
final deviceTokenRepositoryProvider = DeviceTokenRepositoryProvider._();

final class DeviceTokenRepositoryProvider
    extends
        $FunctionalProvider<
          DeviceTokenRepository,
          DeviceTokenRepository,
          DeviceTokenRepository
        >
    with $Provider<DeviceTokenRepository> {
  DeviceTokenRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceTokenRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceTokenRepositoryHash();

  @$internal
  @override
  $ProviderElement<DeviceTokenRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeviceTokenRepository create(Ref ref) {
    return deviceTokenRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceTokenRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceTokenRepository>(value),
    );
  }
}

String _$deviceTokenRepositoryHash() =>
    r'6870e92d025c7b345e98a3d4010034c563f0cc3f';

@ProviderFor(notificationRepository)
final notificationRepositoryProvider = NotificationRepositoryProvider._();

final class NotificationRepositoryProvider
    extends
        $FunctionalProvider<
          NotificationRepository,
          NotificationRepository,
          NotificationRepository
        >
    with $Provider<NotificationRepository> {
  NotificationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationRepositoryHash();

  @$internal
  @override
  $ProviderElement<NotificationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationRepository create(Ref ref) {
    return notificationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationRepository>(value),
    );
  }
}

String _$notificationRepositoryHash() =>
    r'1a3278c215fde1e182197c1aa8857d9bc46b91b2';

@ProviderFor(trustScoreRepository)
final trustScoreRepositoryProvider = TrustScoreRepositoryProvider._();

final class TrustScoreRepositoryProvider
    extends
        $FunctionalProvider<
          TrustScoreRepository,
          TrustScoreRepository,
          TrustScoreRepository
        >
    with $Provider<TrustScoreRepository> {
  TrustScoreRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trustScoreRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trustScoreRepositoryHash();

  @$internal
  @override
  $ProviderElement<TrustScoreRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TrustScoreRepository create(Ref ref) {
    return trustScoreRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrustScoreRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrustScoreRepository>(value),
    );
  }
}

String _$trustScoreRepositoryHash() =>
    r'7dd81d98193ce30b298b6beadf64f6512586dfac';

@ProviderFor(userConsentRepository)
final userConsentRepositoryProvider = UserConsentRepositoryProvider._();

final class UserConsentRepositoryProvider
    extends
        $FunctionalProvider<
          UserConsentRepository,
          UserConsentRepository,
          UserConsentRepository
        >
    with $Provider<UserConsentRepository> {
  UserConsentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userConsentRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userConsentRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserConsentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserConsentRepository create(Ref ref) {
    return userConsentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserConsentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserConsentRepository>(value),
    );
  }
}

String _$userConsentRepositoryHash() =>
    r'9c60f83259de00a947e34c9d15d42e98b0fbf54a';

@ProviderFor(userInfoRepository)
final userInfoRepositoryProvider = UserInfoRepositoryProvider._();

final class UserInfoRepositoryProvider
    extends
        $FunctionalProvider<
          UserInfoRepository,
          UserInfoRepository,
          UserInfoRepository
        >
    with $Provider<UserInfoRepository> {
  UserInfoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userInfoRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userInfoRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserInfoRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserInfoRepository create(Ref ref) {
    return userInfoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserInfoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserInfoRepository>(value),
    );
  }
}

String _$userInfoRepositoryHash() =>
    r'e99b50b6c8d8ae458a95b8607b60739551b8f71e';

@ProviderFor(userInquiryRepository)
final userInquiryRepositoryProvider = UserInquiryRepositoryProvider._();

final class UserInquiryRepositoryProvider
    extends
        $FunctionalProvider<
          UserInquiryRepository,
          UserInquiryRepository,
          UserInquiryRepository
        >
    with $Provider<UserInquiryRepository> {
  UserInquiryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userInquiryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userInquiryRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserInquiryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserInquiryRepository create(Ref ref) {
    return userInquiryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserInquiryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserInquiryRepository>(value),
    );
  }
}

String _$userInquiryRepositoryHash() =>
    r'ccad9788e539e5184d6675fe55c222124d5a0e36';

@ProviderFor(userPreferenceRepository)
final userPreferenceRepositoryProvider = UserPreferenceRepositoryProvider._();

final class UserPreferenceRepositoryProvider
    extends
        $FunctionalProvider<
          UserPreferenceRepository,
          UserPreferenceRepository,
          UserPreferenceRepository
        >
    with $Provider<UserPreferenceRepository> {
  UserPreferenceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userPreferenceRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userPreferenceRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserPreferenceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserPreferenceRepository create(Ref ref) {
    return userPreferenceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserPreferenceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserPreferenceRepository>(value),
    );
  }
}

String _$userPreferenceRepositoryHash() =>
    r'cbc8ea0f80bfca7e5d1e67fea5d5e9ea267cdd33';

@ProviderFor(socialSignInUseCase)
final socialSignInUseCaseProvider = SocialSignInUseCaseProvider._();

final class SocialSignInUseCaseProvider
    extends
        $FunctionalProvider<
          SocialSignInUseCase,
          SocialSignInUseCase,
          SocialSignInUseCase
        >
    with $Provider<SocialSignInUseCase> {
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
    r'9f9fc7176e7de2abc90c9bc3289d18c50dccd64a';
