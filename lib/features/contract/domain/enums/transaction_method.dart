/// 거래 방식
enum TransactionMethod {
  direct, // 직거래
  delivery; // 택배 거래

  String get label => switch (this) {
    TransactionMethod.direct => '직거래',
    TransactionMethod.delivery => '택배 거래',
  };
}
