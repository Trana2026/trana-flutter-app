import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
import 'package:trana/features/profile/presentation/providers/test_user_provider.dart';

part 'provider.g.dart';

/// Supabase 클라이언트 Provider
final supabaseClientProvider = Provider<SupabaseClient>(
  (ref) => Supabase.instance.client,
);

/// Dio Provider
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final url = dotenv.env['BASE_URL'] ?? '';
  final dio = Dio(BaseOptions(baseUrl: url));
  dio.interceptors.addAll([
    InterceptorsWrapper(
      onRequest: (options, handler) {
        // TODO : 테스트용 유저 변경 (accessToken)
        final token = ref.read(testUserProvider)?.accessToken;
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ),
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (o) => print('[DIO] $o'),
    ),
  ]);
  return dio;
}

// S3 업로드 전용 Dio Provider (인증 헤더 없음)
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
  return ContractPdfDataSource(dio);
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
