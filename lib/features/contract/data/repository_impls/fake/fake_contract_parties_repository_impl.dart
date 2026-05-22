import 'package:flutter/foundation.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_parties_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_parties_repository.dart';

/// 인메모리 저장소로 ContractPartiesRepository CRUD 를 테스트하는 Fake 구현체
class FakeContractPartiesRepositoryImpl implements ContractPartiesRepository {
  final _store = <int, ContractPartiesEntity>{};
  int _nextId = 1;

  @override
  Future<Result<void>> createContractParty(ContractPartiesEntity party) async {
    final id = _nextId++;
    _store[id] = party.copyWith(id: id);
    return const Success(null);
  }

  @override
  Future<Result<List<ContractPartiesEntity>>> readContractParties(
    int contractId,
  ) async {
    final parties = _store.values
        .where((p) => p.contractId == contractId)
        .toList();
    return Success(parties);
  }

  @override
  Future<Result<void>> updateContractParty(ContractPartiesEntity party) async {
    if (party.id == null || !_store.containsKey(party.id)) {
      debugPrint(
        '[FakeContractPartiesRepo] updateContractParty: party not found (id=${party.id})',
      );
      return const Failure(ServerFailure());
    }
    _store[party.id!] = party;
    return const Success(null);
  }

  /// 테스트용: 저장된 전체 계약 당사자 목록
  List<ContractPartiesEntity> get all => _store.values.toList();

  /// 테스트용: 저장소 초기화
  void clear() {
    _store.clear();
    _nextId = 1;
  }
}
