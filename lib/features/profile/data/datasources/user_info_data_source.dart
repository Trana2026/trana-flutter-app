import 'package:dio/dio.dart';
import 'package:trana/features/profile/data/dtos/user_info_dto.dart';

class UserInfoDataSource {
  const UserInfoDataSource(this.dio);

  final Dio dio;

  /// GET 본인 정보 조회
  Future<UserInfoDto> getMe() async {
    final response = await dio.get<Map<String, dynamic>>('/v1/users/me');
    return UserInfoDto.fromJson(response.data!);
  }

  /// DELETE 회원 탈퇴
  Future<void> deleteMe() async {
    await dio.delete<void>('/v1/users/me');
  }
}
