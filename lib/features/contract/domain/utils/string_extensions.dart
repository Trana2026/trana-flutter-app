import 'package:intl/intl.dart';

extension StringExtensions on String {
  /// String 10000 > String 10,000 (금액 표시 형식) 변환
  String get toPriceFormat {
    final number = int.tryParse(replaceAll(',', ''));
    if (number == null) {
      return this;
    }
    return NumberFormat('#,###').format(number);
  }

  /// String 01012345678 > 010-1234-5678 (11자리 전화번호 형식) 변환
  String get toPhoneFormat {
    final digits = replaceAll(RegExp(r'\D'), '');
    final d = digits.length > 11 ? digits.substring(0, 11) : digits;
    return switch (d.length) {
      0 => '',
      <= 3 => d,
      <= 7 => '${d.substring(0, 3)}-${d.substring(3)}',
      _ => '${d.substring(0, 3)}-${d.substring(3, 7)}-${d.substring(7)}',
    };
  }
}
