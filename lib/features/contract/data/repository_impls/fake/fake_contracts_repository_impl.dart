import 'package:flutter/foundation.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contracts_entity.dart';
import 'package:trana/features/contract/domain/repositories/contracts_repository.dart';

/// 인메모리 저장소로 ContractsRepository CRUD 를 테스트하는 Fake 구현체
class FakeContractsRepositoryImpl implements ContractsRepository {
  final _store = <int, ContractsEntity>{};
  int _nextId = 1;

  @override
  Future<Result<int>> createContract(ContractsEntity contract) async {
    final id = _nextId++;
    _store[id] = contract.copyWith(id: id);
    return Success(id);
  }

  @override
  Future<Result<ContractsEntity>> readContract(int contractId) async {
    final contract = _store[contractId];
    if (contract == null) {
      debugPrint('[FakeContractsRepo] readContract: contract not found (id=$contractId)');
      return const Failure(ServerFailure());
    }
    return Success(contract);
  }

  @override
  Future<Result<List<ContractsEntity>>> readContracts(int userId) async {
    final contracts = _store.values
        .where((c) => c.senderUserId == userId || c.recipientUserId == userId)
        .toList();
    return Success(contracts);
  }

  @override
  Future<Result<List<ContractsEntity>>> readRecentContracts(
    int userId,
    int days,
  ) async {
    final cutoff = DateTime.now().subtract(Duration(days: days));
    final contracts = _store.values
        .where(
          (c) =>
              (c.senderUserId == userId || c.recipientUserId == userId) &&
              c.createdAt.isAfter(cutoff),
        )
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return Success(contracts);
  }

  @override
  Future<Result<void>> updateContract(ContractsEntity contract) async {
    if (contract.id == null || !_store.containsKey(contract.id)) {
      debugPrint('[FakeContractsRepo] updateContract: contract not found (id=${contract.id})');
      return const Failure(ServerFailure());
    }
    _store[contract.id!] = contract;
    return const Success(null);
  }

  @override
  Future<Result<void>> deleteContract(int id) async {
    if (!_store.containsKey(id)) {
      debugPrint('[FakeContractsRepo] deleteContract: contract not found (id=$id)');
      return const Failure(ServerFailure());
    }
    _store.remove(id);
    return const Success(null);
  }

  /// 테스트용: 저장된 전체 계약 목록
  List<ContractsEntity> get all => _store.values.toList();

  /// 테스트용: 저장소 초기화
  void clear() {
    _store.clear();
    _nextId = 1;
  }
}
