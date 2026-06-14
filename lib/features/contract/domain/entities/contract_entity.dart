import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/role.dart';

part 'contract_entity.freezed.dart';

@freezed
abstract class ContractEntity with _$ContractEntity {
  const factory ContractEntity({
    required String publicCode,
    required ContractStatus status,
    String? title,
    int? price,
    Role? myRole,
    required int attachmentCount,
    String? firstAttachmentUrl,
    required DateTime updatedAt,
  }) = _ContractEntity;
}
