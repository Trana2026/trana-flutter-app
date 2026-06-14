import 'package:trana/core/utils/enum_extension.dart';
import 'package:trana/features/contract/data/dtos/contract_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_entity.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/role.dart';

extension ContractMapper on ContractDto {
  ContractEntity toEntity() {
    return ContractEntity(
      publicCode: publicCode,
      status: ContractStatus.values.fromApiString(status),
      title: title,
      price: price,
      myRole: myRole != null ? Role.values.fromApiString(myRole!) : null,
      attachmentCount: attachmentCount,
      firstAttachmentUrl: firstAttachmentUrl,
      updatedAt: updatedAt,
    );
  }
}
