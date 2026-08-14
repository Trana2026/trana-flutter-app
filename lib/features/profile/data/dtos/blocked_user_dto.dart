import 'package:freezed_annotation/freezed_annotation.dart';

part 'blocked_user_dto.freezed.dart';
part 'blocked_user_dto.g.dart';

@freezed
abstract class BlockedUserDto with _$BlockedUserDto {
  const factory BlockedUserDto({
    required String shareCode,
    required DateTime blockedAt,
  }) = _BlockedUserDto;

  factory BlockedUserDto.fromJson(Map<String, dynamic> json) =>
      _$BlockedUserDtoFromJson(json);
}
