import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_minor_disclosure_confirm_dto.freezed.dart';
part 'contract_minor_disclosure_confirm_dto.g.dart';

@freezed
abstract class ContractMinorDisclosureConfirmDto
    with _$ContractMinorDisclosureConfirmDto {
  const factory ContractMinorDisclosureConfirmDto({
    required DateTime confirmedAt,
    required String templateVersion,
  }) = _ContractMinorDisclosureConfirmDto;

  factory ContractMinorDisclosureConfirmDto.fromJson(
    Map<String, dynamic> json,
  ) => _$ContractMinorDisclosureConfirmDtoFromJson(json);
}
