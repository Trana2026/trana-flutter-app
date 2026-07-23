import 'dart:typed_data';

import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_pdf_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_pdf_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_pdf_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_pdf_repository.dart';

class ContractPdfRepositoryImpl implements ContractPdfRepository {
  const ContractPdfRepositoryImpl(this.dataSource);

  final ContractPdfDataSource dataSource;

  @override
  Future<Result<Uint8List>> preview({required String publicCode}) {
    return guardResult(
      () {
        return dataSource.preview(publicCode);
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('필수 필드가 누락되어 미리보기를 생성할 수 없습니다.'),
        409 => const ConflictFailure('DRAFT 상태이거나 보호자 동의가 미완료입니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractPdfEntity>> pdf({required String publicCode}) {
    return guardResult(
      () async {
        final dto = await dataSource.pdf(publicCode);
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'),
        409 => const ConflictFailure(
          'PDF가 아직 생성되지 않았습니다. markReady가 선행되어야 합니다.',
        ),
        _ => null,
      },
    );
  }

  @override
  Future<Result<Uint8List>> downloadBytes(String url) {
    return guardResult(() {
      return dataSource.downloadBytes(url);
    });
  }
}
