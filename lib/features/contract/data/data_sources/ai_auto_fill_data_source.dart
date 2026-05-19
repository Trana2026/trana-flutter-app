import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class AiAutoFillDataSource {
  AiAutoFillDataSource(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> analyzeImages(List<XFile> images) async {
    final formData = FormData();

    for (final image in images) {
      formData.files.add(
        MapEntry('images', await MultipartFile.fromFile(image.path)),
      );
    }

    final response = await _dio.post(
      '/ai/analyze-contract-images',
      data: formData,
      options: Options(headers: {'Content-Type': 'multipart/form-data'}),
    );

    return Map<String, dynamic>.from(response.data);
  }
}
