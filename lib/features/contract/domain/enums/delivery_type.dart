/// 거래 방식
enum DeliveryType {
  direct, // 직거래
  shipping; // 택배 거래

  String get label => switch (this) {
    DeliveryType.direct => '직거래',
    DeliveryType.shipping => '택배 거래',
  };
}
