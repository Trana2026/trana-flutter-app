import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:image/image.dart' as img;
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

/// 서명 패드 PNG 추출, 색보정, base64 인코딩 로직
class SignatureExportService {
  /// signatureBase64 서버 제한 (raw base64 최대 길이)
  static const maxBase64Length = 262144;

  /// 서명 패드 획을 검정으로 보정한 PNG raw base64 반환 (실패/용량 초과 시 null)
  static Future<String?> export(GlobalKey<SfSignaturePadState> key) async {
    // 서버 제한 초과 시 해상도를 낮춰 1회 재시도
    for (final pixelRatio in const [2.0, 1.0]) {
      final padState = key.currentState;
      if (padState == null) return null;

      final ui.Image image = await padState.toImage(pixelRatio: pixelRatio);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return null;

      final encoded = encodeSignaturePng(
        byteData.buffer.asUint8List(
          byteData.offsetInBytes,
          byteData.lengthInBytes,
        ),
      );
      if (encoded != null && encoded.length <= maxBase64Length) return encoded;
    }
    return null;
  }

  /// PNG bytes의 불투명 픽셀을 검정으로 치환 후 raw base64 인코딩 (디코딩 실패 시 null)
  static String? encodeSignaturePng(Uint8List pngBytes) {
    final png = img.decodePng(pngBytes);
    if (png == null) return null;

    // 다크모드의 밝은 획은 흰 PDF 위에서 보이지 않아 검정으로 치환
    for (final pixel in png) {
      if (pixel.a > 0) {
        pixel
          ..r = 0
          ..g = 0
          ..b = 0;
      }
    }

    return base64Encode(img.encodePng(png));
  }
}
