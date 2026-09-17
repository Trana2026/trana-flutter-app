import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' show Rect;

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  /// PDF 바이트를 임시 파일로 쓴 뒤 시스템 공유 시트 표시
  ///
  /// [sharePositionOrigin] 은 iPad 팝오버 앵커로 필수 (미지정 시 iPad 에서 실패)
  Future<ShareResultStatus> sharePdf({
    required Uint8List bytes,
    required String filename,
    Rect? sharePositionOrigin,
  }) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes);

    final result = await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path, mimeType: 'application/pdf', name: filename)],
        sharePositionOrigin: sharePositionOrigin,
      ),
    );

    return result.status;
  }
}
