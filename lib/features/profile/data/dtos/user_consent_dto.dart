import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_consent_dto.freezed.dart';
part 'user_consent_dto.g.dart';

@freezed
abstract class UserConsentDto with _$UserConsentDto {
  const factory UserConsentDto({
    required int termsId,
    required String type,
    required String version,
    required String title,
    required DateTime agreedAt,
  }) = _UserConsentDto;

  factory UserConsentDto.fromJson(Map<String, dynamic> json) =>
      _$UserConsentDtoFromJson(json);
}
