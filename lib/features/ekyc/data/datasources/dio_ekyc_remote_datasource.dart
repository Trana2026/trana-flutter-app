import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:trana/core/network/api_error_mapper.dart';
import 'package:trana/features/ekyc/data/datasources/ekyc_remote_datasource.dart';
import 'package:trana/features/ekyc/data/models/adult_kyc_result_dto.dart';
import 'package:trana/features/ekyc/data/models/consent_response_dto.dart';
import 'package:trana/features/ekyc/data/models/ocr_response_dto.dart';
import 'package:trana/features/ekyc/data/models/terms_dto.dart';
import 'package:trana/features/ekyc/data/models/verify_response_dto.dart';

/// EkycRemoteDatasource Dio 구현체. 서버 API 호출
class DioEkycRemoteDatasource implements EkycRemoteDatasource {
  final Dio _dio;
  const DioEkycRemoteDatasource(this._dio);

  /// GET /v1/terms
  @override
  Future<List<TermsDto>> getTerms() async {
    try {
      final response = await _dio.get('/v1/terms');
      final list = response.data as List<dynamic>;
      return list
          .map((e) => TermsDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  /// POST /v1/consents
  @override
  Future<ConsentResponseDto> submitConsent({
    required List<int> termsVersionIds,
    required String contextType,
    required String ageGroup,
  }) async {
    try {
      final response = await _dio.post(
        '/v1/consents',
        data: {
          'termsVersionIds': termsVersionIds,
          'contextType': contextType,
          'ageGroup': ageGroup,
        },
      );
      return ConsentResponseDto.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  /// POST /v1/identity/id-card?signupSessionId=
  @override
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
  @override
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
  @override
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
  @override
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
