import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/terms/domain/entities/consent_result_entity.dart';

part 'consent_response_dto.freezed.dart';
part 'consent_response_dto.g.dart';

/// POST /v1/consents 응답 DTO
@freezed
abstract class ConsentResponseDto with _$ConsentResponseDto {
  const factory ConsentResponseDto({String? signupSessionId}) =
      _ConsentResponseDto;

  factory ConsentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ConsentResponseDtoFromJson(json);
}

extension ConsentResponseDtoMapper on ConsentResponseDto {
  ConsentResultEntity toEntity() =>
      ConsentResultEntity(signupSessionId: signupSessionId);
}
