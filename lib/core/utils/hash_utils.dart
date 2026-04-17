import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

class HashUtils {
  HashUtils._();

  /// 바이트 데이터의 SHA-256 해시값을 hex 문자열로 반환
  static String sha256Bytes(Uint8List bytes) {
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// 문자열의 SHA-256 해시값을 hex 문자열로 반환
  static String sha256String(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
