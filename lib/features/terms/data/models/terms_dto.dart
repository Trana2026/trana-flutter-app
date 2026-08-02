import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/terms/domain/entities/terms_entity.dart';

part 'terms_dto.freezed.dart';
part 'terms_dto.g.dart';

/// GET /v1/terms 응답 항목 DTO
@freezed
abstract class TermsDto with _$TermsDto {
  const factory TermsDto({
    required int id,
    required String type,
    required String version,
    required String title,
    required String contentUrl,
    required String effectiveAt,
  }) = _TermsDto;

  factory TermsDto.fromJson(Map<String, dynamic> json) =>
      _$TermsDtoFromJson(json);
}

extension TermsDtoMapper on TermsDto {
  TermsEntity toEntity() => TermsEntity(
    id: id,
    type: type,
    version: version,
    title: title,
    contentUrl: contentUrl,
    effectiveAt: DateTime.parse(effectiveAt),
  );
}
