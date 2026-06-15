// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Dio Provider

@ProviderFor(dio)
final dioProvider = DioProvider._();

/// Dio Provider

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// Dio Provider
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
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

String _$dioHash() => r'4f5fcd4742edd1da81c6e694f65177d22c873bf5';

@ProviderFor(s3Dio)
final s3DioProvider = S3DioProvider._();

final class S3DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
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
    r'92267e427291464fb5258c4fd84e26f4ccebbed6';

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
