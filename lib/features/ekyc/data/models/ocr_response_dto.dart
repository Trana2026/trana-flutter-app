import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/ekyc/domain/entities/id_card_ocr_entity.dart';

part 'ocr_response_dto.freezed.dart';
part 'ocr_response_dto.g.dart';

/// POST /v1/identity/id-card 응답 DTO
@freezed
abstract class OcrResponseDto with _$OcrResponseDto {
  const factory OcrResponseDto({
    required String requestId,
    required String idType,
    required String name,
    required String birthDate,
    required String gender,
  }) = _OcrResponseDto;

  factory OcrResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OcrResponseDtoFromJson(json);
}

extension OcrResponseDtoMapper on OcrResponseDto {
  /// DTO → Domain Entity 변환 매퍼
  IdCardOcrEntity toEntity() => IdCardOcrEntity(
    requestId: requestId,
    idType: idType,
    name: name,
    birthDate: birthDate,
    gender: gender,
  );
}
