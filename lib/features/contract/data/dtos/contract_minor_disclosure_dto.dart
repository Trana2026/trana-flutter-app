import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_minor_disclosure_dto.freezed.dart';
part 'contract_minor_disclosure_dto.g.dart';

@freezed
abstract class ContractMinorDisclosureDto with _$ContractMinorDisclosureDto {
  const factory ContractMinorDisclosureDto({
    required String version,
    required String title,
    required List<String> items,
  }) = _ContractMinorDisclosureDto;

  factory ContractMinorDisclosureDto.fromJson(Map<String, dynamic> json) =>
      _$ContractMinorDisclosureDtoFromJson(json);
}
