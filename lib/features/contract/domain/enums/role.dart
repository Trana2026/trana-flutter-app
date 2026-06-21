/// 역할
enum Role {
  buyer, // 구매자
  seller; // 판매자

  String get label => switch (this) {
    Role.buyer => '구매',
    Role.seller => '판매',
  };
}
