import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preference_dto.freezed.dart';
part 'user_preference_dto.g.dart';

@freezed
abstract class UserPreferenceDto with _$UserPreferenceDto {
  const factory UserPreferenceDto({required bool pushEnabled}) =
      _UserPreferenceDto;

  factory UserPreferenceDto.fromJson(Map<String, dynamic> json) =>
      _$UserPreferenceDtoFromJson(json);
}
