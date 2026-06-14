import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_attachment_dto.freezed.dart';
part 'contract_attachment_dto.g.dart';

@freezed
abstract class ContractAttachmentDto with _$ContractAttachmentDto {
  const factory ContractAttachmentDto({
    required int id,
    required String s3Key,
    required String originalFilename,
    required String contentType,
    required int sizeBytes,
    required String sha256,
    required int sortOrder,
    required DateTime uploadedAt,
    String? viewUrl,
  }) = _ContractAttachmentDto;

  factory ContractAttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$ContractAttachmentDtoFromJson(json);
}
