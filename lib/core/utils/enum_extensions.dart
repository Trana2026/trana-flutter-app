extension EnumApiString on Enum {
  /// enum 상수 > String 대문자 + 스네이크 케이스 변환
  String get apiString => name
      .replaceAllMapped(RegExp(r'(?<=[a-z])[A-Z]'), (m) => '_${m.group(0)}')
      .toUpperCase();
}

extension EnumFromApiString<T extends Enum> on List<T> {
  /// API 응답 문자열 > enum 상수 변환 (없는 값이면 null)
  T? tryFromApiString(String? value) {
    if (value == null) return null;
    for (final e in this) {
      if (e.apiString == value) return e;
    }
    return null;
  }

  /// API 응답 문자열 > enum 상수 변환 (없는 값이면 fallback)
  T fromApiString(String value, {required T fallback}) =>
      tryFromApiString(value) ?? fallback;
}
