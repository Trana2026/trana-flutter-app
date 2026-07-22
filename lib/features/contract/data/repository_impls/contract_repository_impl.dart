import 'package:trana/core/error/result.dart';
import 'package:trana/core/utils/enum_extensions.dart';
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
  }) {
    return guardResult(() async {
      final dtos = await dataSource.readMyContracts(
        status: status?.apiString,
        query: query,
      );
      return dtos.map((dto) => dto.toEntity()).toList();
    });
  }
}
