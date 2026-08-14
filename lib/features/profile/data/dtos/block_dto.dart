import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_dto.freezed.dart';
part 'block_dto.g.dart';

@freezed
abstract class BlockDto with _$BlockDto {
  const factory BlockDto({
    required String blockedShareCode,
    required DateTime blockedAt,
  }) = _BlockDto;

  factory BlockDto.fromJson(Map<String, dynamic> json) =>
      _$BlockDtoFromJson(json);
}
