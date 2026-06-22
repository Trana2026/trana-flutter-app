import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/auth/domain/entities/social_provider.dart';

part 'social_login_view_model.g.dart';

/// 소셜 로그인 ViewModel.
/// provider별 idToken 획득 후 서버 sign-in 하는 방식으로 진행됨
@riverpod
class SocialLoginViewModel extends _$SocialLoginViewModel {
  @override
  void build() {}

  /// 카카오 로그인. 카카오톡 앱/계정으로 idToken 받아 서버 검증
  Future<Result<void>> signInWithKakao() async {
    // ref는 비동기(카카오 로그인) 이전에 미리 읽어둠
    // autoDispose라 긴 await 동안 provider가 dispose되면 await 이후 ref.read가 터짐
    final useCase = ref.read(socialSignInUseCaseProvider);

    late OAuthToken token;
    try {
      // 카카오톡 설치 시 앱 핸드오프, 아니면 카카오계정 로그인
      if (await isKakaoTalkInstalled()) {
        try {
          token = await UserApi.instance.loginWithKakaoTalk();
        } catch (_) {
          token = await UserApi.instance.loginWithKakaoAccount();
        }
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
      }
    } catch (_) {
      // 카카오 로그인 단계 실패. 취소한 경우 포함
      return Failure(const SocialAuthFailure());
    }

    final idToken = token.idToken;
    if (idToken == null || idToken.isEmpty) {
      // OIDC 미활성 시 idToken 누락
      return Failure(
        const SocialAuthFailure('로그인 토큰을 받지 못했습니다. 잠시 후 다시 시도해 주세요.'),
      );
    }

    return useCase.call(provider: SocialProvider.kakao, idToken: idToken);
  }

  /// 구글 로그인. 네이티브 계정 선택으로 idToken 받아 서버 검증
  Future<Result<void>> signInWithGoogle() async {
    // ref는 비동기(구글 로그인) 이전에 미리 읽어둠 (autoDispose 대비, 카카오로그인 코드와 동일)
    final useCase = ref.read(socialSignInUseCaseProvider);

    late final GoogleSignInAccount account;
    try {
      // Android 네이티브 계정 picker / iOS 인앱 보안 세션으로 인증
      account = await GoogleSignIn.instance.authenticate();
    } on GoogleSignInException catch (_) {
      // 사용자 취소, 설정오류 등
      return Failure(const SocialAuthFailure());
    } catch (_) {
      return Failure(const SocialAuthFailure());
    }

    final idToken = account.authentication.idToken;
    if (idToken == null || idToken.isEmpty) {
      // serverClientId 미설정 시 idToken 누락
      return Failure(
        const SocialAuthFailure('로그인 토큰을 받지 못했습니다. 잠시 후 다시 시도해 주세요.'),
      );
    }

    return useCase.call(provider: SocialProvider.google, idToken: idToken);
  }

  /// 애플 로그인. 네이티브 시트로 identityToken 받아 서버 검증
  Future<Result<void>> signInWithApple() async {
    // ref는 비동기(애플 로그인) 이전에 미리 읽어둠 (autoDispose 대비, 카카오로그인 코드와 동일)
    final useCase = ref.read(socialSignInUseCaseProvider);

    late final AuthorizationCredentialAppleID credential;
    try {
      // iOS 네이티브 ASAuthorization 시트로 인증
      credential = await SignInWithApple.getAppleIDCredential(
        scopes: const [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
    } on SignInWithAppleAuthorizationException catch (_) {
      // 사용자 취소 등
      return Failure(const SocialAuthFailure());
    } catch (_) {
      return Failure(const SocialAuthFailure());
    }

    final idToken = credential.identityToken;
    if (idToken == null || idToken.isEmpty) {
      return Failure(
        const SocialAuthFailure('로그인 토큰을 받지 못했습니다. 잠시 후 다시 시도해 주세요.'),
      );
    }

    return useCase.call(provider: SocialProvider.apple, idToken: idToken);
  }
}
