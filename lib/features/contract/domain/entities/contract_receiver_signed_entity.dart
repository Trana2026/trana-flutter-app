import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';

part 'contract_receiver_signed_entity.freezed.dart';

@freezed
abstract class ContractReceiverSignedEntity
    with _$ContractReceiverSignedEntity {
  const factory ContractReceiverSignedEntity({
    required String publicCode,
    required ContractStatus status,
    required int pdfVersion,
    required DateTime receiverSignedAt,
  }) = _ContractReceiverSignedEntity;
}
