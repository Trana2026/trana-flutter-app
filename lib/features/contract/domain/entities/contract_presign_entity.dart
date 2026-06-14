import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_presign_entity.freezed.dart';

@freezed
abstract class ContractPresignEntity with _$ContractPresignEntity {
  const factory ContractPresignEntity({
    required String uploadUrl,
    required String s3Key,
    required DateTime expiresAt,
  }) = _ContractPresignEntity;
}
