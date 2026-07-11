/// 성별
enum Gender {
  male, // 남성
  female, // 여성
  other; // 미등록

  String get label => switch (this) {
    Gender.male => '남성',
    Gender.female => '여성',
    Gender.other => '미등록',
  };
}
