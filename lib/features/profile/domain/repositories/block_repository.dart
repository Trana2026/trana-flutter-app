import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/entities/block_entity.dart';
import 'package:trana/features/profile/domain/entities/blocked_user_entity.dart';

abstract interface class BlockRepository {
  Future<Result<BlockEntity>> blockContractCounterpart(String publicCode);

  Future<Result<List<BlockedUserEntity>>> readBlocks();

  Future<Result<void>> unblock(String shareCode);
}
