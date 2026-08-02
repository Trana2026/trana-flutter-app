import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/network/auth_token_store.dart';
import 'package:trana/core/network/dio_client.dart';
import 'package:trana/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:trana/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:trana/features/auth/data/repositories/pass_auth_repository_impl.dart';
import 'package:trana/features/auth/domain/repositories/auth_repository.dart';
import 'package:trana/features/auth/domain/repositories/pass_auth_repository.dart';
import 'package:trana/features/auth/domain/usecases/social_sign_in_usecase.dart';
import 'package:trana/features/contract/data/data_sources/contract_ai_extraction_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_attachment_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_cancellation_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_dispute_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_draft_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_guardian_consent_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_invitation_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_lifecycle_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_minor_disclosure_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_pdf_data_source.dart';
import 'package:trana/features/contract/data/data_sources/contract_s3_data_source.dart';
import 'package:trana/features/contract/data/repository_impls/contract_ai_extraction_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_attachment_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_cancellation_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_dispute_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_draft_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_guardian_consent_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_invitation_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_lifecycle_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_minor_disclosure_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_pdf_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/contract_repository_impl.dart';
import 'package:trana/features/contract/domain/repositories/contract_ai_extraction_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_attachment_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_cancellation_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_dispute_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_draft_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_guardian_consent_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_invitation_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_lifecycle_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_minor_disclosure_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_pdf_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_repository.dart';
import 'package:trana/features/terms/data/datasources/dio_terms_remote_datasource.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/datasources/ekyc_detection_service.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/datasources/legacy_ekyc_datasource.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/repositories/legacy_ekyc_repository.dart';
import 'package:trana/features/terms/data/repositories/terms_repository_impl.dart';
import 'package:trana/features/terms/domain/repositories/terms_repository.dart';
import 'package:trana/features/guardian/data/datasources/dio_guardian_remote_datasource.dart';
import 'package:trana/features/guardian/data/guardian_link_store.dart';
import 'package:trana/features/guardian/data/repositories/guardian_repository_impl.dart';
import 'package:trana/features/guardian/domain/repositories/guardian_repository.dart';
import 'package:trana/features/notification/data/datasources/notification_data_source.dart';
import 'package:trana/features/notification/data/repository_impls/notification_repository_impl.dart';
import 'package:trana/features/notification/domain/repositories/notification_repository.dart';
import 'package:trana/features/profile/data/datasources/device_token_data_source.dart';
import 'package:trana/features/profile/data/datasources/trust_score_data_source.dart';
import 'package:trana/features/profile/data/datasources/user_consent_data_source.dart';
import 'package:trana/features/profile/data/datasources/user_info_data_source.dart';
import 'package:trana/features/profile/data/datasources/user_inquiry_data_source.dart';
import 'package:trana/features/profile/data/datasources/user_preference_data_source.dart';
import 'package:trana/features/profile/data/services/device_info_service.dart';
import 'package:trana/features/profile/data/repository_impls/device_token_repository_impl.dart';
import 'package:trana/features/profile/data/repository_impls/trust_score_repository_impl.dart';
import 'package:trana/features/profile/data/repository_impls/user_consent_repository_impl.dart';
import 'package:trana/features/profile/data/repository_impls/user_info_repository_impl.dart';
import 'package:trana/features/profile/data/repository_impls/user_inquiry_repository_impl.dart';
import 'package:trana/features/profile/data/repository_impls/user_preference_repository_impl.dart';
import 'package:trana/features/profile/domain/repositories/device_token_repository.dart';
import 'package:trana/features/profile/domain/repositories/trust_score_repository.dart';
import 'package:trana/features/profile/domain/repositories/user_consent_repository.dart';
import 'package:trana/features/profile/domain/repositories/user_info_repository.dart';
import 'package:trana/features/profile/domain/repositories/user_inquiry_repository.dart';
import 'package:trana/features/profile/domain/repositories/user_preference_repository.dart';
import 'package:trana/features/user/data/datasources/user_remote_datasource.dart';
import 'package:trana/features/user/data/repositories/user_repository_impl.dart';
import 'package:trana/features/user/domain/repositories/user_repository.dart';

part 'provider.g.dart';

// secureStorage
@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage();
}

// 인증 토큰 secureStorage
@Riverpod(keepAlive: true)
AuthTokenStore authTokenStore(Ref ref) {
  final secureStorage = ref.read(secureStorageProvider);
  return AuthTokenStore(secureStorage);
}

/// 대리인 인증 링크 secureStorage
@Riverpod(keepAlive: true)
GuardianLinkStore guardianLinkStore(Ref ref) {
  final secureStorage = ref.read(secureStorageProvider);
  return GuardianLinkStore(secureStorage);
}

/// 인증 및 토큰 갱신, 기기 정보 인터셉터 적용된 Dio
@riverpod
Dio dio(Ref ref) {
  final authTokenStore = ref.read(authTokenStoreProvider);
  return createDio(
    authTokenStore,
    userAgentBuilder: DeviceInfoService.getUserAgent,
  );
}

/// S3 업로드 전용 Dio
@Riverpod(keepAlive: true)
Dio s3Dio(Ref ref) {
  return Dio();
}

/// 구 eKYC Native SDK 감지 서비스
@riverpod
EkycDetectionService ekycDetectionService(Ref ref) {
  return EkycDetectionService();
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
ContractCancellationDataSource contractCancellationDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ContractCancellationDataSource(dio);
}

@riverpod
ContractDisputeDataSource contractDisputeDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ContractDisputeDataSource(dio);
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

@riverpod
DeviceTokenDataSource deviceTokenDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return DeviceTokenDataSource(dio);
}

@riverpod
NotificationDataSource notificationDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return NotificationDataSource(dio);
}

@riverpod
TrustScoreDataSource trustScoreDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return TrustScoreDataSource(dio);
}

@riverpod
UserConsentDataSource userConsentDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return UserConsentDataSource(dio);
}

@riverpod
UserInfoDataSource userInfoDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return UserInfoDataSource(dio);
}

@riverpod
UserInquiryDataSource userInquiryDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return UserInquiryDataSource(dio);
}

@riverpod
UserPreferenceDataSource userPreferenceDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return UserPreferenceDataSource(dio);
}

@riverpod
ContractMinorDisclosureDataSource contractMinorDisclosureDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ContractMinorDisclosureDataSource(dio);
}

// ==================== Repository ====================

@riverpod
AuthRepository authRepository(Ref ref) {
  final dio = ref.read(dioProvider);
  final authTokenStore = ref.read(authTokenStoreProvider);
  return AuthRepositoryImpl(DioAuthRemoteDatasource(dio), authTokenStore);
}

@riverpod
PassAuthRepository passAuthRepository(Ref ref) {
  final authTokenStore = ref.read(authTokenStoreProvider);
  return PassAuthRepositoryImpl(authTokenStore);
}

@riverpod
TermsRepository termsRepository(Ref ref) {
  final dio = ref.read(dioProvider);
  return TermsRepositoryImpl(DioTermsRemoteDatasource(dio));
}

@riverpod
LegacyEkycRepository legacyEkycRepository(Ref ref) {
  final dio = ref.read(dioProvider);
  final authTokenStore = ref.read(authTokenStoreProvider);
  return LegacyEkycRepository(LegacyEkycDatasource(dio), authTokenStore);
}

@riverpod
GuardianRepository guardianRepository(Ref ref) {
  final dio = ref.read(dioProvider);
  return GuardianRepositoryImpl(DioGuardianRemoteDatasource(dio));
}

@riverpod
UserRepository userRepository(Ref ref) {
  final dio = ref.read(dioProvider);
  return UserRepositoryImpl(DioUserRemoteDatasource(dio));
}

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
ContractCancellationRepository contractCancellationRepository(Ref ref) {
  final dataSource = ref.watch(contractCancellationDataSourceProvider);
  return ContractCancellationRepositoryImpl(dataSource);
}

@riverpod
ContractDisputeRepository contractDisputeRepository(Ref ref) {
  final dataSource = ref.watch(contractDisputeDataSourceProvider);
  return ContractDisputeRepositoryImpl(dataSource);
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

@riverpod
DeviceTokenRepository deviceTokenRepository(Ref ref) {
  final dataSource = ref.watch(deviceTokenDataSourceProvider);
  return DeviceTokenRepositoryImpl(dataSource);
}

@riverpod
NotificationRepository notificationRepository(Ref ref) {
  final dataSource = ref.watch(notificationDataSourceProvider);
  return NotificationRepositoryImpl(dataSource);
}

@riverpod
TrustScoreRepository trustScoreRepository(Ref ref) {
  final dataSource = ref.watch(trustScoreDataSourceProvider);
  return TrustScoreRepositoryImpl(dataSource);
}

@riverpod
UserConsentRepository userConsentRepository(Ref ref) {
  final dataSource = ref.watch(userConsentDataSourceProvider);
  return UserConsentRepositoryImpl(dataSource);
}

@riverpod
UserInfoRepository userInfoRepository(Ref ref) {
  final dataSource = ref.watch(userInfoDataSourceProvider);
  return UserInfoRepositoryImpl(dataSource);
}

@riverpod
UserInquiryRepository userInquiryRepository(Ref ref) {
  final dataSource = ref.watch(userInquiryDataSourceProvider);
  return UserInquiryRepositoryImpl(dataSource);
}

@riverpod
UserPreferenceRepository userPreferenceRepository(Ref ref) {
  final dataSource = ref.watch(userPreferenceDataSourceProvider);
  return UserPreferenceRepositoryImpl(dataSource);
}

@riverpod
ContractMinorDisclosureRepository contractMinorDisclosureRepository(Ref ref) {
  final dataSource = ref.watch(contractMinorDisclosureDataSourceProvider);
  return ContractMinorDisclosureRepositoryImpl(dataSource);
}

// ==================== UseCase ====================

@riverpod
SocialSignInUseCase socialSignInUseCase(Ref ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return SocialSignInUseCase(authRepository);
}
