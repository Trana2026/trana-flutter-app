import 'package:dio/dio.dart';
import 'package:trana/core/network/api_error_mapper.dart';
import 'package:trana/features/guardian/data/datasources/guardian_remote_datasource.dart';
import 'package:trana/features/guardian/data/models/guardian_link_dto.dart';

class DioGuardianRemoteDatasource implements GuardianRemoteDatasource {
  final Dio _dio;

  const DioGuardianRemoteDatasource(this._dio);

  /// POST /v1/guardian/links (JWT 필요함)
  @override
  Future<GuardianLinkDto> createGuardianLink() async {
    try {
      final response = await _dio.post('/v1/guardian/links');
      return GuardianLinkDto.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }
}
