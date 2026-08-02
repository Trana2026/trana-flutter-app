import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:trana/core/network/api_error_mapper.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/models/adult_kyc_result_dto.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/models/ocr_response_dto.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/models/verify_response_dto.dart';

/// eKYC 신분증/얼굴 인증 서버 API (Dio)
class LegacyEkycDatasource {
  final Dio _dio;
  const LegacyEkycDatasource(this._dio);

  /// POST /v1/identity/id-card?signupSessionId=
  Future<OcrResponseDto> ocrIdCard({
    required String signupSessionId,
    required File file,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      final response = await _dio.post(
        '/v1/identity/id-card',
        queryParameters: {'signupSessionId': signupSessionId},
        data: formData,
      );
      return OcrResponseDto.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  /// POST /v1/identity/verify-id-card
  Future<VerifyResponseDto> verifyIdCard({required String requestId}) async {
    try {
      final response = await _dio.post(
        '/v1/identity/verify-id-card',
        data: {'requestId': requestId},
      );
      return VerifyResponseDto.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  /// POST /v1/identity/phone
  Future<void> submitPhone({
    required String requestId,
    required String phone,
  }) async {
    try {
      await _dio.post(
        '/v1/identity/phone',
        data: {'requestId': requestId, 'phone': phone.replaceAll('-', '')},
      );
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  /// POST /v1/identity/face-compare?requestId=
  Future<AdultKycResultDto> compareFace({
    required String requestId,
    required File file,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      final response = await _dio.post(
        '/v1/identity/face-compare',
        queryParameters: {'requestId': requestId},
        data: formData,
      );
      return AdultKycResultDto.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }
}
