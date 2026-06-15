import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';

part 'contract_signed_entity.freezed.dart';

@freezed
abstract class ContractSignedEntity with _$ContractSignedEntity {
  const factory ContractSignedEntity({
    required String publicCode,
    required ContractStatus status,
    required int pdfVersion,
    required DateTime creatorSignedAt,
  }) = _ContractSignedEntity;
}
