import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_draft_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_entity.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/repositories/contract_repository.dart';

class ContractRepositoryImpl implements ContractRepository {
  const ContractRepositoryImpl(this.dataSource);

  final ContractDraftDataSource dataSource;

  @override
  Future<Result<List<ContractEntity>>> readMyContracts({
    ContractStatus? status,
    String? query,
  }) async {
    try {
      final dtos = await dataSource.readMyContracts(
        status: status?.apiString,
        query: query,
      );
      return Success(dtos.map((dto) => dto.toEntity()).toList());
    } on DioException catch (e) {
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
