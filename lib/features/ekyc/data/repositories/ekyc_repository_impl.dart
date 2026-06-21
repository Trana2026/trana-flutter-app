import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/network/auth_token_store.dart';
import 'package:trana/features/ekyc/data/datasources/ekyc_remote_datasource.dart';
import 'package:trana/features/ekyc/data/models/adult_kyc_result_dto.dart';
import 'package:trana/features/ekyc/data/models/consent_response_dto.dart';
import 'package:trana/features/ekyc/data/models/ocr_response_dto.dart';
import 'package:trana/features/ekyc/data/models/terms_dto.dart';
import 'package:trana/features/ekyc/data/models/verify_response_dto.dart';
import 'package:trana/features/ekyc/domain/entities/adult_kyc_result_entity.dart';
import 'package:trana/features/ekyc/domain/entities/consent_result_entity.dart';
import 'package:trana/features/ekyc/domain/entities/id_card_ocr_entity.dart';
import 'package:trana/features/ekyc/domain/entities/terms_entity.dart';
import 'package:trana/features/ekyc/domain/entities/verify_result_entity.dart';
import 'package:trana/features/ekyc/domain/repositories/ekyc_repository.dart';

/// EkycRepository 구현체
class EkycRepositoryImpl implements EkycRepository {
  final EkycRemoteDatasource _remote;
  final AuthTokenStore _tokenStore;
  EkycRepositoryImpl(this._remote, this._tokenStore);

  /// 활성 약관 목록 조회
  @override
  Future<Result<List<TermsEntity>>> getTerms() async {
    try {
      final dtos = await _remote.getTerms();
      return Success(dtos.map((e) => e.toEntity()).toList());
    } catch (e, st) {
      debugPrint('[EkycRepo] error: $e\n$st');
      return Failure(const UnknownFailure());
    }
  }

  /// 약관 동의 및 signupSessionId 발급
  @override
  Future<Result<ConsentResultEntity>> submitConsent({
    required List<int> termsVersionIds,
    required String contextType,
    required String ageGroup,
  }) async {
    try {
      final dto = await _remote.submitConsent(
        termsVersionIds: termsVersionIds,
        contextType: contextType,
        ageGroup: ageGroup,
      );
      return Success(dto.toEntity());
    } catch (e, st) {
      debugPrint('[EkycRepo] error: $e\n$st');
      return Failure(const UnknownFailure());
    }
  }

  /// 신분증 OCR 수행 후, requestId 발급 (인증단계들을 묶어서 식별하는용도)
  @override
  Future<Result<IdCardOcrEntity>> ocrIdCard({
    required String signupSessionId,
    required File imageFile,
  }) async {
    try {
      final dto = await _remote.ocrIdCard(
        signupSessionId: signupSessionId,
        file: imageFile,
      );
      return Success(dto.toEntity());
    } catch (e, st) {
      debugPrint('[EkycRepo] error: $e\n$st');
      return Failure(const UnknownFailure());
    }
  }

  /// 신분증 진위확인
  @override
  Future<Result<VerifyResultEntity>> verifyIdCard({
    required String requestId,
  }) async {
    try {
      final dto = await _remote.verifyIdCard(requestId: requestId);
      return Success(dto.toEntity());
    } catch (e, st) {
      debugPrint('[EkycRepo] error: $e\n$st');
      return Failure(const UnknownFailure());
    }
  }

  /// 휴대폰 번호 기록
  @override
  Future<Result<void>> submitPhone({
    required String requestId,
    required String phone,
  }) async {
    try {
      await _remote.submitPhone(requestId: requestId, phone: phone);
      return const Success(null);
    } catch (e, st) {
      debugPrint('[EkycRepo] error: $e\n$st');
      return Failure(const UnknownFailure());
    }
  }

  /// 얼굴 비교 + 성인 가입 완료
  @override
  Future<Result<AdultKycResultEntity>> compareFace({
    required String requestId,
    required File imageFile,
  }) async {
    try {
      final dto = await _remote.compareFace(
        requestId: requestId,
        file: imageFile,
      );
      // 성인 가입 완료. 발급된 JWT를 토큰 저장소에 저장 (세션 유지)
      _tokenStore.accessToken = dto.accessToken;
      _tokenStore.refreshToken = dto.refreshToken;
      return Success(dto.toEntity());
    } catch (e, st) {
      debugPrint('[EkycRepo] error: $e\n$st');
      return Failure(const UnknownFailure());
    }
  }
}
