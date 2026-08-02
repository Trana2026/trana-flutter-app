import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_response_dto.freezed.dart';
part 'sign_in_response_dto.g.dart';

/// POST /v1/auth/social/sign-in 응답 DTO
@freezed
abstract class SignInResponseDto with _$SignInResponseDto {
  const factory SignInResponseDto({
    required String accessToken,
    required String refreshToken,
    required String publicCode,
  }) = _SignInResponseDto;

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseDtoFromJson(json);
}
