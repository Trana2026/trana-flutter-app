import 'package:dio/dio.dart';
import 'package:trana/core/error/failure.dart';

/// DioException를 AppFailure로 변환. 서버 ProblemDetail의 code 필드 기준 분기
class ApiErrorMapper {
  ApiErrorMapper._();

  /// DioException을 AppFailure 서브클래스로 변환
  static AppFailure map(DioException e) {
    final response = e.response;

    if (response == null) {
      return const NetworkFailure();
    }

    if (response.statusCode != null && response.statusCode! >= 500) {
      return const ServerFailure();
    }

    final data = response.data;
    if (data is! Map<String, dynamic>) {
      return const UnknownFailure();
    }

    final code = data['code'] as String?;
    final detail = data['detail'] as String?;

    return switch (code) {
      'IDENTITY_422_OCR' => const OcrFailure(),
      'IDENTITY_422_VERIFY' => VerifyFailure(hint: data['hint'] as String?),
      'IDENTITY_422_COMPARE' => const FaceCompareFailure(),
      'IDENTITY_410_SESSION' => const SessionExpiredFailure(
        isSignupSession: false,
      ),
      'IDENTITY_410_SIGNUP' => const SessionExpiredFailure(
        isSignupSession: true,
      ),
      'IDENTITY_409_DUPLICATE' => const DuplicateIdentityFailure(),
      'GUARDIAN_410_LINK' ||
      'GUARDIAN_404_LINK' => const GuardianLinkExpiredFailure(),
      'GUARDIAN_409_VERIFIED' => const GuardianAlreadyVerifiedFailure(),
      'GUARDIAN_403_NOT_MINOR' => const GuardianNotMinorFailure(),
      'AUTH_401_SOCIAL' => const SocialAuthFailure(),
      'AUTH_401' || 'AUTH_401_TOKEN' => const UnauthorizedFailure(),
      _ => UnknownFailure(detail ?? '알 수 없는 오류가 발생했습니다.'),
    };
  }
}
