import 'dart:typed_data';

import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_dispute_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_dispute_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_dispute_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_dispute_repository.dart';

class ContractDisputeRepositoryImpl implements ContractDisputeRepository {
  const ContractDisputeRepositoryImpl(this.dataSource);

  final ContractDisputeDataSource dataSource;

  @override
  Future<Result<List<ContractDisputeEntity>>> readDisputes(String publicCode) {
    return guardResult(
      () async {
        final dto = await dataSource.readDisputes(publicCode);
        return dto.disputes.map((d) => d.toEntity()).toList();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractDisputeEntity>> reportDispute({
    required String publicCode,
    required String reason,
    required String detail,
  }) {
    return guardResult(
      () async {
        final dto = await dataSource.reportDispute(
          publicCode,
          reason: reason,
          detail: detail,
        );
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'),
        409 => const ConflictFailure('신고 가능 상태가 아니거나 이미 활성 신고가 있습니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<Uint8List>> downloadEvidencePackage(String publicCode) {
    return guardResult(
      () {
        return dataSource.downloadEvidencePackage(publicCode);
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('계약 참여자가 아니거나 활성 신고가 없습니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<bool>> cancelDispute({
    required String publicCode,
    required int disputeId,
  }) {
    return guardResult(
      () async {
        await dataSource.cancelDispute(publicCode, disputeId);
        return true;
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        404 => const NotFoundFailure('신고를 찾을 수 없거나 본인 신고가 아니거나 이미 취소되었습니다.'),
        _ => null,
      },
    );
  }
}
