import 'package:dio/dio.dart';
import 'package:trana/features/profile/data/dtos/user_info_dto.dart';

class UserInfoDataSource {
  const UserInfoDataSource(this.dio);

  final Dio dio;

  /// PATCH 본인 정보 수정 (이메일 / 성별)
  Future<UserInfoDto> patchProfile({String? email, String? gender}) async {
    final response = await dio.patch<Map<String, dynamic>>(
      '/v1/users/me/profile',
      data: {'email': email, 'gender': gender}
        ..removeWhere((_, value) => value == null),
    );
    return UserInfoDto.fromJson(response.data!);
  }

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
