import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_signed_dto.freezed.dart';
part 'contract_signed_dto.g.dart';

@freezed
abstract class ContractSignedDto with _$ContractSignedDto {
  const factory ContractSignedDto({
    required String publicCode,
    required String status,
    required int pdfVersion,
    required DateTime creatorSignedAt,
  }) = _ContractSignedDto;

  factory ContractSignedDto.fromJson(Map<String, dynamic> json) =>
      _$ContractSignedDtoFromJson(json);
}
