import 'package:dio/dio.dart';
import 'package:trana/features/ekyc/data/models/terms_dto.dart';

class TermDataSource {
  const TermDataSource(this.dio);

  final Dio dio;

  /// GET 약관 단일 조회
  Future<TermsDto> getTermByType(String type) async {
    final response = await dio.get<Map<String, dynamic>>('/v1/terms/$type');
    return TermsDto.fromJson(response.data!);
  }
}
