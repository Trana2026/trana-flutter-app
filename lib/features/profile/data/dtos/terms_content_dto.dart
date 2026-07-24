import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/profile/domain/entities/terms_content_entity.dart';
import 'package:trana/features/profile/domain/enums/terms_type.dart';

part 'terms_content_dto.freezed.dart';
part 'terms_content_dto.g.dart';

/// GET /v1/terms/{id} 응답 DTO
@freezed
abstract class TermsContentDto with _$TermsContentDto {
  const factory TermsContentDto({
    required int id,
    required String type,
    required String version,
    required String title,
    required String contentHash,
    required String content,
    required String effectiveAt,
  }) = _TermsContentDto;

  factory TermsContentDto.fromJson(Map<String, dynamic> json) =>
      _$TermsContentDtoFromJson(json);
}

extension TermsContentDtoMapper on TermsContentDto {
  /// DTO > Entity 변환
  TermsContentEntity toEntity() => TermsContentEntity(
    id: id,
    type: TermsType.values.fromApiString(type, fallback: TermsType.service),
    version: version,
    title: title,
    contentHash: contentHash,
    content: content,
    effectiveAt: DateTime.parse(effectiveAt),
  );
}
