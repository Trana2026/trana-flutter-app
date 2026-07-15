import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_cancellation_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_cancellation_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_cancellation_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_cancellation_repository.dart';

class ContractCancellationRepositoryImpl
    implements ContractCancellationRepository {
  const ContractCancellationRepositoryImpl(this.dataSource);

  final ContractCancellationDataSource dataSource;

  @override
  Future<Result<ContractCancellationEntity>> requestCancellation({
    required String publicCode,
    required String reason,
    required String detail,
  }) async {
    try {
      final dto = await dataSource.requestCancellation(
        publicCode,
        reason: reason,
        detail: detail,
      );
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(
          ForbiddenFailure('계약 참여자가 아니거나 송신 측이 요청할 수 없습니다.'),
        );
      }
      if (e.response?.statusCode == 409) {
        return const Failure(
          ConflictFailure('취소 요청 가능 상태가 아니거나 이미 활성 요청이 있습니다.'),
        );
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<bool>> confirmCancellation(String publicCode) async {
    try {
      await dataSource.confirmCancellation(publicCode);
      return const Success(true);
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(
          ForbiddenFailure('계약 참여자가 아니거나 요청자 본인은 확정할 수 없습니다.'),
        );
      }
      if (e.response?.statusCode == 404) {
        return const Failure(NotFoundFailure('활성 취소 요청이 없습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> revokeCancellation(String publicCode) async {
    try {
      await dataSource.revokeCancellation(publicCode);
      return const Success(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(ForbiddenFailure('계약 참여자가 아니거나 요청자 본인이 아닙니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(NotFoundFailure('활성 취소 요청이 없습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractCancellationEntity?>> readActiveCancellation(
    String publicCode,
  ) async {
    try {
      final dto = await dataSource.readActiveCancellation(publicCode);
      return Success(dto?.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
