import 'package:dio/dio.dart';
import 'package:trana/features/ekyc/data/models/terms_dto.dart';
import 'package:trana/features/profile/data/dtos/terms_content_dto.dart';

class TermDataSource {
  const TermDataSource(this.dio);

  final Dio dio;

  /// GET 약관 단건 + 마크다운 전문 조회
  Future<TermsContentDto> getTermContent(int id) async {
    final response = await dio.get<Map<String, dynamic>>('/v1/terms/$id');
    return TermsContentDto.fromJson(response.data!);
  }

  /// GET 활성 약관 목록 조회
  Future<List<TermsDto>> getActiveTerms() async {
    final response = await dio.get<List<dynamic>>('/v1/terms');
    return response.data!
        .map((e) => TermsDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET 계약 서명 필수 약관 목록 조회
  Future<List<TermsDto>> getContractTerms() async {
    final response = await dio.get<List<dynamic>>(
      '/v1/terms',
      queryParameters: {'context': 'CONTRACT'},
    );
    return response.data!
        .map((e) => TermsDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
