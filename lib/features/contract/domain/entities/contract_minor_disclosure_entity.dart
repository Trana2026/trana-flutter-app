import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_minor_disclosure_entity.freezed.dart';

@freezed
abstract class ContractMinorDisclosureEntity
    with _$ContractMinorDisclosureEntity {
  const factory ContractMinorDisclosureEntity({
    required String version,
    required String title,
    required List<String> items,
  }) = _ContractMinorDisclosureEntity;
}
