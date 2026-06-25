import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/network/auth_token_store.dart';
import 'package:trana/core/network/dio_client.dart';
import 'package:trana/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:trana/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:trana/features/auth/domain/repositories/auth_repository.dart';
import 'package:trana/features/auth/domain/usecases/social_sign_in_usecase.dart';
import 'package:trana/features/contract/data/data_sources/contract_ai_extraction_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_attachment_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_draft_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_guardian_consent_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_invitation_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_lifecycle_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_pdf_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_s3_data_source.dart';
import 'package:trana/features/contract/data/repository_impls/contract_ai_extraction_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_attachment_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_draft_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_guardian_consent_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_invitation_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_lifecycle_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_pdf_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_repository_impl.dart';
import 'package:trana/features/contract/domain/repositories/contract_ai_extraction_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_attachment_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_draft_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_guardian_consent_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_invitation_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_lifecycle_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_pdf_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_repository.dart';
import 'package:trana/features/ekyc/data/datasources/dio_ekyc_remote_datasource.dart';
import 'package:trana/features/ekyc/data/datasources/ekyc_detection_service.dart';
import 'package:trana/features/ekyc/data/repositories/ekyc_repository_impl.dart';
import 'package:trana/features/ekyc/domain/repositories/ekyc_repository.dart';
import 'package:trana/features/guardian/data/datasources/dio_guardian_remote_datasource.dart';
import 'package:trana/features/guardian/data/guardian_link_store.dart';
import 'package:trana/features/guardian/data/repositories/guardian_repository_impl.dart';
import 'package:trana/features/guardian/domain/repositories/guardian_repository.dart';
import 'package:trana/features/user/data/datasources/user_remote_datasource.dart';
import 'package:trana/features/user/data/repositories/user_repository_impl.dart';
import 'package:trana/features/user/domain/repositories/user_repository.dart';

part 'provider.g.dart';

/// Dio (Interceptor를 통한 토큰 자동부착 / refresh 재시도)
@riverpod
Dio dio(Ref ref) => createDio(ref.read(authTokenStoreProvider));

/// Native SDK 감지 서비스
@riverpod
EkycDetectionService ekycDetectionService(Ref ref) => EkycDetectionService();

/// secure storage
@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) => const FlutterSecureStorage();

/// 토큰 저장소 (secure storage)
@Riverpod(keepAlive: true)
AuthTokenStore authTokenStore(Ref ref) =>
    AuthTokenStore(ref.read(secureStorageProvider));

/// 보호자 링크 저장소 (secure storage)
@Riverpod(keepAlive: true)
GuardianLinkStore guardianLinkStore(Ref ref) =>
    GuardianLinkStore(ref.read(secureStorageProvider));

/// AuthRepository
@riverpod
AuthRepository authRepository(Ref ref) => AuthRepositoryImpl(
  DioAuthRemoteDatasource(ref.read(dioProvider)),
  ref.read(authTokenStoreProvider),
);

/// EkycRepository
@riverpod
EkycRepository ekycRepository(Ref ref) => EkycRepositoryImpl(
  DioEkycRemoteDatasource(ref.read(dioProvider)),
  ref.read(authTokenStoreProvider),
);

/// GuardianRepository
@riverpod
GuardianRepository guardianRepository(Ref ref) =>
    GuardianRepositoryImpl(DioGuardianRemoteDatasource(ref.read(dioProvider)));

/// UserRepository
@riverpod
UserRepository userRepository(Ref ref) =>
    UserRepositoryImpl(DioUserRemoteDatasource(ref.read(dioProvider)));

/// 소셜 로그인 UseCase
@riverpod
SocialSignInUseCase socialSignInUseCase(Ref ref) =>
    SocialSignInUseCase(ref.read(authRepositoryProvider));

/// S3 업로드 전용 Dio (인증 헤더 없음)
@Riverpod(keepAlive: true)
Dio s3Dio(Ref ref) {
  return Dio();
}

// ==================== DataSource ====================

@riverpod
ContractDraftDataSource contractDraftDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ContractDraftDataSource(dio);
}

@riverpod
ContractAttachmentDataSource contractAttachmentDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ContractAttachmentDataSource(dio);
}

@riverpod
ContractS3DataSource contractS3DataSource(Ref ref) {
  final dio = ref.watch(s3DioProvider);
  return ContractS3DataSource(dio);
}

@riverpod
ContractAiExtractionDataSource contractAiExtractionDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ContractAiExtractionDataSource(dio);
}

@riverpod
ContractGuardianConsentDataSource contractGuardianConsentDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ContractGuardianConsentDataSource(dio);
}

@riverpod
ContractInvitationDataSource contractInvitationDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ContractInvitationDataSource(dio);
}

@riverpod
ContractLifecycleDataSource contractLifecycleDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ContractLifecycleDataSource(dio);
}

@riverpod
ContractPdfDataSource contractPdfDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  final s3Dio = ref.watch(s3DioProvider);
  return ContractPdfDataSource(dio, s3Dio);
}

// ==================== Repository ====================

@riverpod
ContractRepository contractRepository(Ref ref) {
  final dataSource = ref.watch(contractDraftDataSourceProvider);
  return ContractRepositoryImpl(dataSource);
}

@riverpod
ContractDraftRepository contractDraftRepository(Ref ref) {
  final dataSource = ref.watch(contractDraftDataSourceProvider);
  return ContractDraftRepositoryImpl(dataSource);
}

@riverpod
ContractAttachmentRepository contractAttachmentRepository(Ref ref) {
  final dataSource = ref.watch(contractAttachmentDataSourceProvider);
  final s3DataSource = ref.watch(contractS3DataSourceProvider);
  return ContractAttachmentRepositoryImpl(dataSource, s3DataSource);
}

@riverpod
ContractAiExtractionRepository contractAiExtractionRepository(Ref ref) {
  final dataSource = ref.watch(contractAiExtractionDataSourceProvider);
  return ContractAiExtractionRepositoryImpl(dataSource);
}

@riverpod
ContractGuardianConsentRepository contractGuardianConsentRepository(Ref ref) {
  final dataSource = ref.watch(contractGuardianConsentDataSourceProvider);
  return ContractGuardianConsentRepositoryImpl(dataSource);
}

@riverpod
ContractInvitationRepository contractInvitationRepository(Ref ref) {
  final dataSource = ref.watch(contractInvitationDataSourceProvider);
  return ContractInvitationRepositoryImpl(dataSource);
}

@riverpod
ContractLifecycleRepository contractLifecycleRepository(Ref ref) {
  final dataSource = ref.watch(contractLifecycleDataSourceProvider);
  return ContractLifecycleRepositoryImpl(dataSource);
}

@riverpod
ContractPdfRepository contractPdfRepository(Ref ref) {
  final dataSource = ref.watch(contractPdfDataSourceProvider);
  return ContractPdfRepositoryImpl(dataSource);
}
