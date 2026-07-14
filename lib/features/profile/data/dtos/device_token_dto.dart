import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_token_dto.freezed.dart';
part 'device_token_dto.g.dart';

@freezed
abstract class DeviceTokenDto with _$DeviceTokenDto {
  const factory DeviceTokenDto({
    required int id,
    required String platform,
    String? deviceModel,
    String? osVersion,
    String? appVersion,
    required DateTime createdAt,
    DateTime? lastUsedAt,
  }) = _DeviceTokenDto;

  factory DeviceTokenDto.fromJson(Map<String, dynamic> json) =>
      _$DeviceTokenDtoFromJson(json);
}
