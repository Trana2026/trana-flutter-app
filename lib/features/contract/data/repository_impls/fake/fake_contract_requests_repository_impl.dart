import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_requests_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_requests_repository.dart';

/// 인메모리 저장소로 ContractRequestsRepository CRUD 를 테스트하는 Fake 구현체
class FakeContractRequestsRepositoryImpl implements ContractRequestsRepository {
  final _store = <String, ContractRequestsEntity>{};

  @override
  Future<Result<String>> createRequest(int contractId) async {
    final token = Random().nextInt(999999).toString().padLeft(6, '0');
    _store[token] = ContractRequestsEntity(
      contractId: contractId,
      token: token,
      createdAt: DateTime.now(),
    );
    return Success(token);
  }

  @override
  Future<Result<ContractRequestsEntity?>> readRequest(String token) async {
    return Success(_store[token]);
  }

  @override
  Future<Result<List<ContractRequestsEntity>>> readRequests() async {
    return Success(_store.values.toList());
  }

  @override
  Future<Result<void>> deleteRequest(int contractId) async {
    final key = _store.entries
        .where((e) => e.value.contractId == contractId)
        .map((e) => e.key)
        .firstOrNull;
    if (key == null) {
      debugPrint(
        '[FakeContractRequestsRepo] deleteRequest: not found (contractId=$contractId)',
      );
      return const Failure(ServerFailure());
    }
    _store.remove(key);
    return const Success(null);
  }

  /// 테스트용: 저장소 초기화
  void clear() => _store.clear();
}
