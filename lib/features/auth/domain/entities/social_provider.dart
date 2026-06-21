/// 소셜 로그인 제공자
enum SocialProvider {
  kakao,
  google,
  apple;

  /// 서버 전송용 enum 값 (KAKAO | GOOGLE | APPLE)
  String get apiValue => switch (this) {
    SocialProvider.kakao => 'KAKAO',
    SocialProvider.google => 'GOOGLE',
    SocialProvider.apple => 'APPLE',
  };
}
