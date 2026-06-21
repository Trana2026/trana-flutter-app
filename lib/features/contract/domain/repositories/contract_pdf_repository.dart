import 'dart:typed_data';

import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_pdf_entity.dart';

abstract interface class ContractPdfRepository {
  Future<Result<Uint8List>> preview({required String publicCode});

  Future<Result<ContractPdfEntity>> pdf({required String publicCode});
}
