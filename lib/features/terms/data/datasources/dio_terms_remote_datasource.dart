import 'package:dio/dio.dart';
import 'package:trana/core/network/api_error_mapper.dart';
import 'package:trana/features/terms/data/datasources/terms_remote_datasource.dart';
import 'package:trana/features/terms/data/models/consent_response_dto.dart';
import 'package:trana/features/terms/data/models/terms_content_dto.dart';
import 'package:trana/features/terms/data/models/terms_dto.dart';

class DioTermsRemoteDatasource implements TermsRemoteDatasource {
  final Dio _dio;
  const DioTermsRemoteDatasource(this._dio);

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

  /// GET /v1/terms?context=CONTRACT
  @override
  Future<List<TermsDto>> getContractTerms() async {
    final response = await _dio.get<List<dynamic>>(
      '/v1/terms',
      queryParameters: {'context': 'CONTRACT'},
    );
    return response.data!
        .map((e) => TermsDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /v1/terms/{id}
  @override
  Future<TermsContentDto> getTermContent(int id) async {
    final response = await _dio.get<Map<String, dynamic>>('/v1/terms/$id');
    return TermsContentDto.fromJson(response.data!);
  }
}
