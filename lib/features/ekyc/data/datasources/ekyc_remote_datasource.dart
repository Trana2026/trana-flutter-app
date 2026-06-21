import 'dart:io';

import 'package:trana/features/ekyc/data/models/adult_kyc_result_dto.dart';
import 'package:trana/features/ekyc/data/models/consent_response_dto.dart';
import 'package:trana/features/ekyc/data/models/ocr_response_dto.dart';
import 'package:trana/features/ekyc/data/models/terms_dto.dart';
import 'package:trana/features/ekyc/data/models/verify_response_dto.dart';

/// eKYC 서버 API 호출 인터페이스
abstract interface class EkycRemoteDatasource {
  /// GET /v1/terms
  Future<List<TermsDto>> getTerms();

  /// POST /v1/consents
  Future<ConsentResponseDto> submitConsent({
    required List<int> termsVersionIds,
    required String contextType,
    required String ageGroup,
  });

  /// POST /v1/identity/id-card?signupSessionId=
  Future<OcrResponseDto> ocrIdCard({
    required String signupSessionId,
    required File file,
  });

  /// POST /v1/identity/verify-id-card
  Future<VerifyResponseDto> verifyIdCard({required String requestId});

  /// POST /v1/identity/phone
  Future<void> submitPhone({required String requestId, required String phone});

  /// POST /v1/identity/face-compare?requestId=
  Future<AdultKycResultDto> compareFace({
    required String requestId,
    required File file,
  });
}
