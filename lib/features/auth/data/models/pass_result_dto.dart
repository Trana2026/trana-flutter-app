import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/auth/domain/entities/pass_result_entity.dart';

part 'pass_result_dto.freezed.dart';
part 'pass_result_dto.g.dart';

/// PASS 웹뷰 콜백 DTO
@freezed
abstract class PassResultDto with _$PassResultDto {
  const factory PassResultDto({
    String? purpose,
    String? accessToken,
    String? refreshToken,
    String? publicCode,
    bool? requiresGuardian,
    String? resultCode,
    String? statusCode,
    String? resultMsg,
    String? code,
  }) = _PassResultDto;

  factory PassResultDto.fromJson(Map<String, dynamic> json) =>
      _$PassResultDtoFromJson(json);
}

extension PassResultDtoMapper on PassResultDto {
  /// 회원가입 성공 여부 검증
  bool get isSignUpSuccess =>
      purpose == 'SIGNUP' &&
      (accessToken?.isNotEmpty ?? false) &&
      (refreshToken?.isNotEmpty ?? false);

  PassResultEntity toEntity() => PassResultEntity(
    accessToken: accessToken ?? '',
    refreshToken: refreshToken ?? '',
    publicCode: publicCode ?? '',
    requiresGuardian: requiresGuardian ?? false,
  );
}
