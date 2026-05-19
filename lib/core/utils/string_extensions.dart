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
}
