import 'package:trana/features/profile/data/dtos/block_dto.dart';
import 'package:trana/features/profile/domain/entities/block_entity.dart';

extension BlockMapper on BlockDto {
  BlockEntity toEntity() {
    return BlockEntity(
      blockedShareCode: blockedShareCode,
      blockedAt: blockedAt,
    );
  }
}
