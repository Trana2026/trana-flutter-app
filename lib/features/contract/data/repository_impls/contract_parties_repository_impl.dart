import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_parties_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_parties_repository.dart';

class ContractPartiesRepositoryImpl implements ContractPartiesRepository {
  ContractPartiesRepositoryImpl();

  @override
  Future<Result<void>> createContractParty(ContractPartiesEntity party) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractPartiesRepo] createContractParty: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractPartiesRepo] createContractParty unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<List<ContractPartiesEntity>>> readContractParties(
    int contractId,
  ) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractPartiesRepo] readContractParties: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractPartiesRepo] readContractParties unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> updateContractParty(ContractPartiesEntity party) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractPartiesRepo] updateContractParty: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractPartiesRepo] updateContractParty unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }
}
