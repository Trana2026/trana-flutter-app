class Validation {
  Validation._();

  /// 금액 숫자 검증
  static String? price(String? v) {
    if (v == null || int.tryParse(v.replaceAll(',', '')) == null) {
      return '금액은 숫자로 입력해주세요.';
    }
    return null;
  }

  /// 휴대폰 번호 형식 검증
  static String? phone(String? v) {
    if (v == null || !RegExp(r'^010-\d{4}-\d{4}$').hasMatch(v)) {
      return '연락처를 올바른 형식으로 입력해주세요.';
    }
    return null;
  }

  /// 전화번호 비교용 정규화 (숫자만 추출, 국가번호 82 → 0)
  static String normalizePhone(String v) {
    final digits = v.replaceAll(RegExp(r'\D'), '');
    if (digits.startsWith('82')) return '0${digits.substring(2)}';
    return digits;
  }

  /// 이메일 형식 검증
  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) {
      return '이메일을 입력해주세요.';
    }
    final email = v.trim();
    final regex = RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
    if (!regex.hasMatch(email)) {
      return '올바른 이메일 형식을 입력해주세요.';
    }
    return null;
  }
}
