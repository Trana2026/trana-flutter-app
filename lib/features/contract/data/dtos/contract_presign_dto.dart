import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_presign_dto.freezed.dart';
part 'contract_presign_dto.g.dart';

@freezed
abstract class ContractPresignDto with _$ContractPresignDto {
  const factory ContractPresignDto({
    required String uploadUrl,
    required String s3Key,
    required DateTime expiresAt,
  }) = _ContractPresignDto;

  factory ContractPresignDto.fromJson(Map<String, dynamic> json) =>
      _$ContractPresignDtoFromJson(json);
}
