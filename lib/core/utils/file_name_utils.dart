import 'dart:convert';

/// 파일명에 사용할 수 없는 문자 제거 후 UTF-8 바이트 길이 제한
String sanitizeFileName(
  String name, {
  int maxBytes = 120,
  String fallback = 'file',
}) {
  final cleaned = name
      .replaceAll(RegExp(r'[\\/:*?"<>|]'), ' ')
      .replaceAll(RegExp(r'[\x00-\x1f\x7f]'), '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  if (cleaned.isEmpty) return fallback;

  final truncated = _truncateUtf8(cleaned, maxBytes);
  return truncated.isEmpty ? fallback : truncated;
}

/// UTF-8 기준 [maxBytes] 이하로 자르기 (문자 중간에서 끊기지 않음)
String _truncateUtf8(String value, int maxBytes) {
  if (utf8.encode(value).length <= maxBytes) return value;

  final buffer = StringBuffer();
  var byteCount = 0;

  for (final rune in value.runes) {
    final runeBytes = utf8.encode(String.fromCharCode(rune)).length;
    if (byteCount + runeBytes > maxBytes) break;
    buffer.writeCharCode(rune);
    byteCount += runeBytes;
  }

  return buffer.toString().trimRight();
}
