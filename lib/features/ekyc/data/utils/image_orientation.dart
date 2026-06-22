import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

/// 셀카 EXIF 회전을 픽셀에 굽고 EXIF 제거. 서버가 EXIF를 무시해도 정방향 보장하기 위함.
/// 디코드 실패 시 원본 파일 그대로 반환
Future<File> bakeOrientationAndStripExif(File src) async {
  try {
    final bytes = await src.readAsBytes();
    final baked = await compute(_bake, bytes);
    if (baked == null) return src;
    final out = File('${src.path}_baked.jpg');
    await out.writeAsBytes(baked);
    return out;
  } catch (_) {
    return src;
  }
}

/// 별도 isolate에서 실행.
/// JPEG 디코드 - EXIF 방향 적용 - EXIF 없는 JPEG 재인코딩
Uint8List? _bake(Uint8List bytes) {
  final decoded = img.decodeJpg(bytes);
  if (decoded == null) return null;
  final oriented = img.bakeOrientation(decoded);
  return img.encodeJpg(oriented, quality: 92);
}
