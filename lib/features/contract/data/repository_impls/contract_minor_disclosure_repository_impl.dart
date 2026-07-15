import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_minor_disclosure_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_minor_disclosure_confirm_mapper.dart';
import 'package:trana/features/contract/data/mappers/contract_minor_disclosure_latest_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_minor_disclosure_confirm_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_minor_disclosure_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_minor_disclosure_repository.dart';

class ContractMinorDisclosureRepositoryImpl
    implements ContractMinorDisclosureRepository {
  const ContractMinorDisclosureRepositoryImpl(this.dataSource);

  final ContractMinorDisclosureDataSource dataSource;

  @override
  Future<Result<ContractMinorDisclosureEntity>> readLatest() async {
    try {
      final dto = await dataSource.readLatest();
      return Success(dto.toEntity());
    } on DioException catch (e) {
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractMinorDisclosureConfirmEntity>> confirm({
    required String publicCode,
    required DateTime disclosedAt,
    required String templateVersion,
  }) async {
    try {
      final dto = await dataSource.confirm(
        publicCode: publicCode,
        disclosedAt: disclosedAt,
        templateVersion: templateVersion,
      );
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Failure(UnauthorizedFailure('인증이 필요합니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(NotFoundFailure('계약을 찾을 수 없습니다.'));
      }
      if (e.response?.statusCode == 409) {
        return const Failure(
          ConflictFailure('상대방이 미성년자가 아닌 계약에서는 위험 고지 확인이 불필요합니다.'),
        );
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
