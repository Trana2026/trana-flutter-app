import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/ekyc/domain/entities/verify_result_entity.dart';

part 'verify_response_dto.freezed.dart';
part 'verify_response_dto.g.dart';

/// POST /v1/identity/verify-id-card 응답 DTO
@freezed
abstract class VerifyResponseDto with _$VerifyResponseDto {
  const factory VerifyResponseDto({
    required String requestId,
    required bool verified,
  }) = _VerifyResponseDto;

  factory VerifyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseDtoFromJson(json);
}

extension VerifyResponseDtoMapper on VerifyResponseDto {
  /// DTO → Domain Entity 변환 매퍼
  VerifyResultEntity toEntity() =>
      VerifyResultEntity(requestId: requestId, verified: verified);
}
