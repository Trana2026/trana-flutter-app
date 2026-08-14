import 'package:freezed_annotation/freezed_annotation.dart';

part 'blocked_user_entity.freezed.dart';

@freezed
abstract class BlockedUserEntity with _$BlockedUserEntity {
  const factory BlockedUserEntity({
    required String shareCode,
    required DateTime blockedAt,
  }) = _BlockedUserEntity;
}
