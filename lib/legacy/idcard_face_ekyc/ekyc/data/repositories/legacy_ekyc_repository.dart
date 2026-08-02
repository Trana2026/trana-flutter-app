import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/network/auth_token_store.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/datasources/legacy_ekyc_datasource.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/models/adult_kyc_result_dto.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/models/ocr_response_dto.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/models/verify_response_dto.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/domain/entities/adult_kyc_result_entity.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/domain/entities/id_card_ocr_entity.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/domain/entities/verify_result_entity.dart';

class LegacyEkycRepository {
  final LegacyEkycDatasource _remote;
  final AuthTokenStore _tokenStore;
  LegacyEkycRepository(this._remote, this._tokenStore);

  /// 신분증 OCR 수행 후, requestId 발급
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
      debugPrint('[LegacyEkycRepo] error: $e\n$st');
      return Failure(const UnknownFailure());
    }
  }

  /// 신분증 진위확인
  Future<Result<VerifyResultEntity>> verifyIdCard({
    required String requestId,
  }) async {
    try {
      final dto = await _remote.verifyIdCard(requestId: requestId);
      return Success(dto.toEntity());
    } catch (e, st) {
      debugPrint('[LegacyEkycRepo] error: $e\n$st');
      return Failure(const UnknownFailure());
    }
  }

  /// 휴대폰 번호 기록
  Future<Result<void>> submitPhone({
    required String requestId,
    required String phone,
  }) async {
    try {
      await _remote.submitPhone(requestId: requestId, phone: phone);
      return const Success(null);
    } catch (e, st) {
      debugPrint('[LegacyEkycRepo] error: $e\n$st');
      return Failure(const UnknownFailure());
    }
  }

  /// 얼굴 비교 + 성인 가입 완료
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
      debugPrint('[LegacyEkycRepo] error: $e\n$st');
      return Failure(const UnknownFailure());
    }
  }
}
