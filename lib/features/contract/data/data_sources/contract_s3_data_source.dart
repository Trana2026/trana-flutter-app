import 'dart:typed_data';

import 'package:dio/dio.dart';

class ContractS3DataSource {
  const ContractS3DataSource(this._dio);

  final Dio _dio;

  Future<void> upload({
    required String uploadUrl,
    required Uint8List bytes,
    required String contentType,
  }) async {
    await _dio.put(
      uploadUrl,
      data: Stream.fromIterable([bytes]),
      options: Options(
        contentType: contentType,
        headers: {'Content-Length': bytes.length},
        // S3 presigned URL은 응답 body 없이 200/204 반환
        validateStatus: (status) => status != null && status < 400,
      ),
    );
  }
}
