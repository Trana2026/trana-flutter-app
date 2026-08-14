import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_entity.freezed.dart';

@freezed
abstract class BlockEntity with _$BlockEntity {
  const factory BlockEntity({
    required String blockedShareCode,
    required DateTime blockedAt,
  }) = _BlockEntity;
}
