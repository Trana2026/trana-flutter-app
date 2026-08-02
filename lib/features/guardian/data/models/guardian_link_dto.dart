import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/guardian/domain/entities/guardian_link_entity.dart';

part 'guardian_link_dto.freezed.dart';
part 'guardian_link_dto.g.dart';

/// POST /v1/guardian/links 응답 DTO
@freezed
abstract class GuardianLinkDto with _$GuardianLinkDto {
  const factory GuardianLinkDto({
    required String token,
    required String expiresAt,
    required String verifyUrl,
  }) = _GuardianLinkDto;

  factory GuardianLinkDto.fromJson(Map<String, dynamic> json) =>
      _$GuardianLinkDtoFromJson(json);
}

extension GuardianLinkDtoMapper on GuardianLinkDto {
  GuardianLinkEntity toEntity() => GuardianLinkEntity(
    token: token,
    expiresAt: DateTime.parse(expiresAt),
    verifyUrl: verifyUrl,
  );
}
