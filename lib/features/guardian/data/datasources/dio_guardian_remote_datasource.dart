import 'package:dio/dio.dart';
import 'package:trana/core/network/api_error_mapper.dart';
import 'package:trana/features/guardian/data/datasources/guardian_remote_datasource.dart';
import 'package:trana/features/guardian/data/models/guardian_link_dto.dart';
import 'package:trana/features/guardian/data/models/user_me_dto.dart';

/// GuardianRemoteDatasource Dio 구현체.
/// AuthInterceptor가 인증 헤더 자동 부착
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

  /// GET /v1/users/me (JWT 필요함)
  /// 보호자 인증 완료 폴링용으로 사용
  @override
  Future<UserMeDto> getMe() async {
    try {
      final response = await _dio.get('/v1/users/me');
      return UserMeDto.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }
}
