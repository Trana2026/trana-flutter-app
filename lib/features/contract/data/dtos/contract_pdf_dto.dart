import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_pdf_dto.freezed.dart';
part 'contract_pdf_dto.g.dart';

@freezed
abstract class ContractPdfDto with _$ContractPdfDto {
  const factory ContractPdfDto({
    required String downloadUrl,
    required int expiresInSeconds,
    required String sha256,
  }) = _ContractPdfDto;

  factory ContractPdfDto.fromJson(Map<String, dynamic> json) =>
      _$ContractPdfDtoFromJson(json);
}
