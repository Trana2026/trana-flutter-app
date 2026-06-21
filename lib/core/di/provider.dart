import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/network/auth_token_store.dart';
import 'package:trana/core/network/dio_client.dart';
import 'package:trana/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:trana/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:trana/features/auth/domain/repositories/auth_repository.dart';
import 'package:trana/features/auth/domain/usecases/social_sign_in_usecase.dart';
import 'package:trana/features/ekyc/data/datasources/dio_ekyc_remote_datasource.dart';
import 'package:trana/features/ekyc/data/repositories/ekyc_repository_impl.dart';
import 'package:trana/features/ekyc/domain/repositories/ekyc_repository.dart';
import 'package:trana/features/guardian/data/datasources/dio_guardian_remote_datasource.dart';
import 'package:trana/features/guardian/data/guardian_link_store.dart';
import 'package:trana/features/guardian/data/repositories/guardian_repository_impl.dart';
import 'package:trana/features/ekyc/data/datasources/ekyc_detection_service.dart';
import 'package:trana/features/guardian/domain/repositories/guardian_repository.dart';

part 'provider.g.dart';

/// Dio (인증 인터셉터 = 토큰 자동부착 + 401 refresh 재시도)
@riverpod
Dio dio(Ref ref) => createDio(ref.read(authTokenStoreProvider));

/// Native SDK 감지 서비스
@riverpod
EkycDetectionService ekycDetectionService(Ref ref) => EkycDetectionService();

/// 보안 저장소 (토큰 등 민감정보). 앱 세션 동안 단일 인스턴스
@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) => const FlutterSecureStorage();

/// 토큰 저장소 (secure storage 영속). 앱 세션 동안 단일 인스턴스
@Riverpod(keepAlive: true)
AuthTokenStore authTokenStore(Ref ref) =>
    AuthTokenStore(ref.read(secureStorageProvider));

/// 보호자 링크 저장소 (secure storage 영속). 앱 세션 동안 단일 인스턴스
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
GuardianRepository guardianRepository(Ref ref) => GuardianRepositoryImpl(
  DioGuardianRemoteDatasource(ref.read(dioProvider)),
);

/// 소셜 로그인 UseCase
@riverpod
SocialSignInUseCase socialSignInUseCase(Ref ref) =>
    SocialSignInUseCase(ref.read(authRepositoryProvider));
