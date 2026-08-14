import 'package:trana/features/profile/data/dtos/blocked_user_dto.dart';
import 'package:trana/features/profile/domain/entities/blocked_user_entity.dart';

extension BlockedUserMapper on BlockedUserDto {
  BlockedUserEntity toEntity() {
    return BlockedUserEntity(shareCode: shareCode, blockedAt: blockedAt);
  }
}
