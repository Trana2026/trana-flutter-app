import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_dto.freezed.dart';
part 'contract_dto.g.dart';

@freezed
abstract class ContractDto with _$ContractDto {
  const factory ContractDto({
    required String publicCode,
    required String status,
    String? title,
    int? price,
    String? myRole,
    required int attachmentCount,
    String? firstAttachmentUrl,
    required DateTime updatedAt,
  }) = _ContractDto;

  factory ContractDto.fromJson(Map<String, dynamic> json) =>
      _$ContractDtoFromJson(json);
}
