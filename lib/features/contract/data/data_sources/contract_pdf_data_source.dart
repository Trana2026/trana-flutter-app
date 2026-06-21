import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_pdf_dto.dart';

class ContractPdfDataSource {
  const ContractPdfDataSource(this.dio);

  final Dio dio;

  /// GET DRAFT 미리보기 PDF byte stream
  Future<Uint8List> preview(String publicCode) async {
    final response = await dio.get<List<int>>(
      '/v1/contracts/$publicCode/preview',
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(response.data!);
  }

  /// GET PDF 다운로드 URL 발급
  Future<ContractPdfDto> pdf(String publicCode) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/pdf',
    );
    return ContractPdfDto.fromJson(response.data!);
  }
}
