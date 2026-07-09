import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preference_entity.freezed.dart';

@freezed
abstract class UserPreferenceEntity with _$UserPreferenceEntity {
  const factory UserPreferenceEntity({required bool pushEnabled}) =
      _UserPreferenceEntity;
}
