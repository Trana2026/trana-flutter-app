import 'dart:io';

import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contracts_entity.dart';
import 'package:trana/features/contract/domain/repositories/contracts_repository.dart';

class ContractsRepositoryImpl implements ContractsRepository {
  @override
  Future<Result<int>> createContract(ContractsEntity contract) async {
    try {
      // TODO: implement createContract
      throw UnimplementedError();
    } on SocketException {
      return const Failure(NetworkFailure());
    } on UnauthorizedFailure {
      return const Failure(UnauthorizedFailure());
    } catch (e) {
      return Failure(UnknownFailure('계약 생성 실패: $e'));
    }
  }

  @override
  Future<Result<void>> deleteContract(int id) async {
    try {
      // TODO: implement deleteContract
      throw UnimplementedError();
    } on SocketException {
      return const Failure(NetworkFailure());
    } on UnauthorizedFailure {
      return const Failure(UnauthorizedFailure());
    } catch (e) {
      return Failure(UnknownFailure('계약 삭제 실패: $e'));
    }
  }

  @override
  Future<Result<ContractsEntity>> readContract(int contractId) async {
    try {
      // TODO: implement readContract
      throw UnimplementedError();
    } on SocketException {
      return const Failure(NetworkFailure());
    } on UnauthorizedFailure {
      return const Failure(UnauthorizedFailure());
    } catch (e) {
      return Failure(UnknownFailure('계약 조회 실패: $e'));
    }
  }

  @override
  Future<Result<List<ContractsEntity>>> readContracts(int userId) async {
    try {
      // TODO: implement readContracts
      throw UnimplementedError();
    } on SocketException {
      return const Failure(NetworkFailure());
    } on UnauthorizedFailure {
      return const Failure(UnauthorizedFailure());
    } catch (e) {
      return Failure(UnknownFailure('계약 목록 조회 실패: $e'));
    }
  }

  @override
  Future<Result<List<ContractsEntity>>> readRecentContracts(
    int userId,
    int days,
  ) async {
    try {
      // TODO: implement readRecentContracts
      throw UnimplementedError();
    } on SocketException {
      return const Failure(NetworkFailure());
    } on UnauthorizedFailure {
      return const Failure(UnauthorizedFailure());
    } catch (e) {
      return Failure(UnknownFailure('최근 계약 목록 조회 실패: $e'));
    }
  }

  @override
  Future<Result<void>> updateContract(ContractsEntity contract) async {
    try {
      // TODO: implement updateContract
      throw UnimplementedError();
    } on SocketException {
      return const Failure(NetworkFailure());
    } on UnauthorizedFailure {
      return const Failure(UnauthorizedFailure());
    } catch (e) {
      return Failure(UnknownFailure('계약 수정 실패: $e'));
    }
  }
}
