import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_pdf_dto.dart';

class ContractPdfDataSource {
  const ContractPdfDataSource(this.dio, this.s3Dio);

  final Dio dio;
  final Dio s3Dio;

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

  /// Presigned URL에서 PDF bytes 다운로드 (인증 헤더 없이)
  Future<Uint8List> downloadBytes(String url) async {
    final response = await s3Dio.get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(response.data!);
  }
}
