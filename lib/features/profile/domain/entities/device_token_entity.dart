import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/profile/domain/enums/device_platform.dart';

part 'device_token_entity.freezed.dart';

@freezed
abstract class DeviceTokenEntity with _$DeviceTokenEntity {
  const factory DeviceTokenEntity({
    required int id,
    required DevicePlatform platform,
    String? deviceModel,
    String? osVersion,
    String? appVersion,
    required DateTime createdAt,
    DateTime? lastUsedAt,
  }) = _DeviceTokenEntity;
}
