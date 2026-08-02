import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/domain/entities/adult_kyc_result_entity.dart';

part 'adult_kyc_result_dto.freezed.dart';
part 'adult_kyc_result_dto.g.dart';

/// POST /v1/identity/face-compare 응답 DTO
@freezed
abstract class AdultKycResultDto with _$AdultKycResultDto {
  const factory AdultKycResultDto({
    required String accessToken,
    required String refreshToken,
    required String publicCode,
    required bool requiresGuardian,
  }) = _AdultKycResultDto;

  factory AdultKycResultDto.fromJson(Map<String, dynamic> json) =>
      _$AdultKycResultDtoFromJson(json);
}

extension AdultKycResultDtoMapper on AdultKycResultDto {
  AdultKycResultEntity toEntity() => AdultKycResultEntity(
    accessToken: accessToken,
    refreshToken: refreshToken,
    publicCode: publicCode,
    requiresGuardian: requiresGuardian,
  );
}
