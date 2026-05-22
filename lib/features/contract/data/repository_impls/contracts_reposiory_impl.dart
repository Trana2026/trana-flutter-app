import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contracts_entity.dart';
import 'package:trana/features/contract/domain/repositories/contracts_repository.dart';

class ContractsRepositoryImpl implements ContractsRepository {
  ContractsRepositoryImpl();

  @override
  Future<Result<int>> createContract(ContractsEntity contract) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractsRepo] createContract: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractsRepo] createContract unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractsEntity>> readContract(int contractId) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractsRepo] readContract: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractsRepo] readContract unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<List<ContractsEntity>>> readContracts(int userId) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractsRepo] readContracts: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractsRepo] readContracts unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<List<ContractsEntity>>> readRecentContracts(
    int userId,
    int days,
  ) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractsRepo] readRecentContracts: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractsRepo] readRecentContracts unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> updateContract(ContractsEntity contract) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractsRepo] updateContract: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractsRepo] updateContract unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> deleteContract(int id) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractsRepo] deleteContract: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractsRepo] deleteContract unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }
}
