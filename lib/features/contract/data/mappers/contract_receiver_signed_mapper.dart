import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/contract/data/dtos/contract_receiver_signed_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_receiver_signed_entity.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';

extension ContractReceiverSignedMapper on ContractReceiverSignedDto {
  ContractReceiverSignedEntity toEntity() {
    return ContractReceiverSignedEntity(
      publicCode: publicCode,
      status: ContractStatus.values.fromApiString(status, fallback: ContractStatus.inProgress),
      pdfVersion: pdfVersion,
      receiverSignedAt: receiverSignedAt,
    );
  }
}
