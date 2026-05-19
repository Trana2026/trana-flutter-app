import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

/// 하이브리드 추출 (사용자가 선택한 거래 사진 중 AI 분석시킬 주요 사진 2개만 선별) 로직
class ImageFilterService {
  static const _keywords = [
    '가격',
    '금액',
    '원',
    '판매',
    '구매',
    '상태',
    '사용',
    '미개봉',
    '배송',
    '성능',
    '하자',
  ];

  final _recognizer = TextRecognizer();

  /// 텍스트 감지 후 키워드 포함 정도 상위 2개 이미지 선택 및 압축
  Future<List<XFile>> extractBestImages(List<XFile> images) async {
    final scored = <({XFile file, int score})>[];

    for (final image in images) {
      final input = InputImage.fromFilePath(image.path);
      final result = await _recognizer.processImage(input);
      final text = result.text;
      if (text.trim().isEmpty) continue;

      int score = text.length;
      for (final keyword in _keywords) {
        if (text.contains(keyword)) {
          score += 50;
        }
      }
      scored.add((file: image, score: score));
    }
    scored.sort((a, b) => b.score.compareTo(a.score));

    final selected = scored.take(2).map((e) => e.file).toList();
    final compressed = await Future.wait(selected.map(_compressImage));
    return compressed;
  }

  Future<XFile> _compressImage(XFile file) async {
    final targetPath = '${file.path}_compressed.jpg';
    final compressed = await FlutterImageCompress.compressAndGetFile(
      file.path,
      targetPath,
      quality: 80,
      minWidth: 1200,
      minHeight: 1200,
    );
    return XFile(compressed!.path);
  }

  void dispose() {
    _recognizer.close();
  }
}
