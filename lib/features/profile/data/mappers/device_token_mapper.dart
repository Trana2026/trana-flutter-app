import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/profile/data/dtos/device_token_dto.dart';
import 'package:trana/features/profile/domain/entities/device_token_entity.dart';
import 'package:trana/features/profile/domain/enums/device_platform.dart';

extension DeviceTokenMapper on DeviceTokenDto {
  DeviceTokenEntity toEntity() {
    return DeviceTokenEntity(
      id: id,
      platform: DevicePlatform.values.fromApiString(platform),
      createdAt: createdAt,
      lastUsedAt: lastUsedAt,
    );
  }
}
