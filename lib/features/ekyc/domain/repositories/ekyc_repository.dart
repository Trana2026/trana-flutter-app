import 'dart:io';

import 'package:trana/core/error/result.dart';
import 'package:trana/features/ekyc/domain/entities/adult_kyc_result_entity.dart';
import 'package:trana/features/ekyc/domain/entities/consent_result_entity.dart';
import 'package:trana/features/ekyc/domain/entities/id_card_ocr_entity.dart';
import 'package:trana/features/ekyc/domain/entities/terms_entity.dart';
import 'package:trana/features/ekyc/domain/entities/verify_result_entity.dart';

/// eKYC 인증 데이터 접근 인터페이스
abstract interface class EkycRepository {
  /// 활성 약관 목록 조회
  Future<Result<List<TermsEntity>>> getTerms();

  /// 약관 동의 및 signupSessionId 발급
  Future<Result<ConsentResultEntity>> submitConsent({
    required List<int> termsVersionIds,
    required String contextType,
    required String ageGroup,
  });

  /// 신분증 OCR 수행 후, requestId 발급 (인증단계들을 묶어서 식별하는용도)
  Future<Result<IdCardOcrEntity>> ocrIdCard({
    required String signupSessionId,
    required File imageFile,
  });

  /// 신분증 진위확인
  Future<Result<VerifyResultEntity>> verifyIdCard({required String requestId});

  /// 휴대폰 번호 기록
  Future<Result<void>> submitPhone({
    required String requestId,
    required String phone,
  });

  /// 얼굴 비교 + 성인 가입 완료
  Future<Result<AdultKycResultEntity>> compareFace({
    required String requestId,
    required File imageFile,
  });
}
