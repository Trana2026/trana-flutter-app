import 'dart:async';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

/// 하이브리드 추출 (사용자가 선택한 거래 사진 중 AI 분석시킬 주요 사진 2개만 필터링) 로직
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

  static const _totalTimeout = Duration(seconds: 20);

  /// 텍스트 감지 후 키워드 포함 정도 상위 2개 이미지 선택 및 압축
  Future<List<XFile>> extractBestImages(List<XFile> images) async {
    // 전체 작업에 타임아웃 적용 (개별 이미지는 무제한)
    final results = await Future.wait(images.map(_scoreImage))
        .timeout(_totalTimeout, onTimeout: () => []);
    final scored = results.nonNulls.toList()
      ..sort((a, b) => b.score.compareTo(a.score));

    // 텍스트 있는 이미지 중 상위 2개, 없으면 원본 중 앞 2개
    final selected = scored.isNotEmpty
        ? scored.take(2).map((e) => e.file).toList()
        : images.take(2).toList();

    try {
      // 항상 압축 후 반환 (API 페이로드 최소화)
      return await Future.wait(selected.map(_compressImage));
    } catch (_) {
      // 압축 실패 시 비압축 원본으로 폴백
      return selected;
    }
  }

  Future<({XFile file, int score})?> _scoreImage(XFile image) async {
    TextRecognizer? recognizer;
    try {
      recognizer = TextRecognizer();
      final input = InputImage.fromFilePath(image.path);
      final result = await recognizer.processImage(input);

      final text = result.text;
      if (text.trim().isEmpty) return null;

      int score = text.length;
      for (final keyword in _keywords) {
        if (text.contains(keyword)) score += 50;
      }
      return (file: image, score: score);
    } on TimeoutException {
      return null;
    } catch (_) {
      return null;
    } finally {
      recognizer?.close();
    }
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

  void dispose() {}
}
