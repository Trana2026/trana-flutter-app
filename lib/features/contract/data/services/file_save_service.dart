import 'package:flutter/services.dart';

/// 안드로이드 시스템 문서 저장(SAF) 브릿지
///
/// 저장소 권한 없이 사용자가 저장 위치를 직접 선택하는 방식
class FileSaveService {
  static const _channel = MethodChannel('com.trana/file_save');

  /// 저장 위치 선택 후 파일 저장 (사용자가 취소하면 false)
  Future<bool> saveDocument({
    required Uint8List bytes,
    required String filename,
    String mimeType = 'application/pdf',
  }) async {
    final saved = await _channel.invokeMethod<bool>('saveDocument', {
      'bytes': bytes,
      'fileName': filename,
      'mimeType': mimeType,
    });

    return saved ?? false;
  }
}
