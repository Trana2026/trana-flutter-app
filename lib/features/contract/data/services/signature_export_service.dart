import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:image/image.dart' as img;
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

/// 서명 패드 PNG 추출
class SignatureExportService {
  /// base64 서버 제한크기
  static const maxBase64Length = 262144;

  static Future<String?> export(GlobalKey<SfSignaturePadState> key) async {
    // 서버 제한 초과 시 해상도를 낮춰서 1회 재시도
    for (final pixelRatio in const [2.0, 1.0]) {
      final padState = key.currentState;
      if (padState == null) return null;

      // png 형태로 서명 추출
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

  /// 서명 검정색 보정 후 base64 인코딩
  static String? encodeSignaturePng(Uint8List pngBytes) {
    final png = img.decodePng(pngBytes);
    if (png == null) return null;

    // 검정색으로 색 보정
    // 다크 모드 서명시 하얀색이라 PDF에서 보이지 않는 문제
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
