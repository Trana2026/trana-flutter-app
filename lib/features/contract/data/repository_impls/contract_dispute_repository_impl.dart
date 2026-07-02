import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
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
  Future<Result<List<ContractDisputeEntity>>> readDisputes(
    String publicCode,
  ) async {
    try {
      final dto = await dataSource.readDisputes(publicCode);
      return Success(dto.disputes.map((d) => d.toEntity()).toList());
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractDisputeEntity>> reportDispute({
    required String publicCode,
    required String reason,
    required String detail,
  }) async {
    try {
      final dto = await dataSource.reportDispute(
        publicCode,
        reason: reason,
        detail: detail,
      );
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'));
      }
      if (e.response?.statusCode == 409) {
        return const Failure(ConflictFailure('신고 가능 상태가 아니거나 이미 활성 신고가 있습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<Uint8List>> downloadEvidencePackage(
    String publicCode,
  ) async {
    try {
      final bytes = await dataSource.downloadEvidencePackage(publicCode);
      return Success(bytes);
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(ForbiddenFailure('계약 참여자가 아니거나 활성 신고가 없습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<bool>> cancelDispute({
    required String publicCode,
    required int disputeId,
  }) async {
    try {
      await dataSource.cancelDispute(publicCode, disputeId);
      return const Success(true);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Failure(NotFoundFailure('신고를 찾을 수 없거나 본인 신고가 아니거나 이미 취소되었습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
