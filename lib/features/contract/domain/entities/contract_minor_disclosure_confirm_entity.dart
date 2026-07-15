import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_minor_disclosure_confirm_entity.freezed.dart';

@freezed
abstract class ContractMinorDisclosureConfirmEntity
    with _$ContractMinorDisclosureConfirmEntity {
  const factory ContractMinorDisclosureConfirmEntity({
    required DateTime confirmedAt,
    required String templateVersion,
  }) = _ContractMinorDisclosureConfirmEntity;
}
