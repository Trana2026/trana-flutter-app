import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/data/datasources/block_data_source.dart';
import 'package:trana/features/profile/data/mappers/block_mapper.dart';
import 'package:trana/features/profile/data/mappers/blocked_user_mapper.dart';
import 'package:trana/features/profile/domain/entities/block_entity.dart';
import 'package:trana/features/profile/domain/entities/blocked_user_entity.dart';
import 'package:trana/features/profile/domain/repositories/block_repository.dart';

class BlockRepositoryImpl implements BlockRepository {
  const BlockRepositoryImpl(this.dataSource);

  final BlockDataSource dataSource;

  @override
  Future<Result<BlockEntity>> blockContractCounterpart(String publicCode) {
    return guardResult(
      () async {
        final dto = await dataSource.blockContractCounterpart(publicCode);
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('상대방이 확정되지 않은 계약입니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<List<BlockedUserEntity>>> readBlocks() {
    return guardResult(() async {
      final dtos = await dataSource.getBlocks();
      return dtos.map((dto) => dto.toEntity()).toList();
    });
  }

  @override
  Future<Result<void>> unblock(String shareCode) {
    return guardResult(() => dataSource.unblock(shareCode));
  }
}
