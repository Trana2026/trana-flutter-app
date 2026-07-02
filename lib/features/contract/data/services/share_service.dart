import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  /// PDF URL을 다운로드 후 시스템 공유 시트 표시
  Future<void> sharePdf(String url, {String filename = 'contract.pdf'}) async {
    final response = await Dio().get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    final bytes = Uint8List.fromList(response.data!);
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes);
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path, mimeType: 'application/pdf', name: filename)],
      ),
    );
  }
}
