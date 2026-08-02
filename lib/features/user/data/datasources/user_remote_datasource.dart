import 'package:dio/dio.dart';
import 'package:trana/core/network/api_error_mapper.dart';
import 'package:trana/features/user/data/models/user_me_dto.dart';

/// 사용자 API 호출 datasource 인터페이스
abstract interface class UserRemoteDatasource {
  /// GET /v1/users/me
  Future<UserMeDto> getMe();
}

class DioUserRemoteDatasource implements UserRemoteDatasource {
  final Dio _dio;

  const DioUserRemoteDatasource(this._dio);

  /// GET /v1/users/me (JWT 필요함)
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
