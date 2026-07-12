import 'package:dio/dio.dart';
import 'package:trana/features/profile/data/dtos/user_inquiry_dto.dart';

class UserInquiryDataSource {
  const UserInquiryDataSource(this.dio);

  final Dio dio;

  /// GET 1:1 문의 목록 조회 (본인)
  Future<List<UserInquiryDto>> getInquiries() async {
    final response = await dio.get<List<dynamic>>('/v1/users/me/inquiries');
    return (response.data ?? [])
        .map((e) => UserInquiryDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST 1:1 문의 작성
  Future<UserInquiryDto> postInquiry({
    required String email,
    required String title,
    required String content,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/users/me/inquiries',
      data: {'email': email, 'title': title, 'content': content},
    );
    return UserInquiryDto.fromJson(response.data!);
  }

  /// GET 1:1 문의 상세 조회 (본인)
  Future<UserInquiryDto> getInquiryDetail(String publicCode) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v1/users/me/inquiries/$publicCode',
    );
    return UserInquiryDto.fromJson(response.data!);
  }
}
