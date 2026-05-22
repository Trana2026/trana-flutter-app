import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_requests_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_requests_repository.dart';

class ContractRequestsRepositoryImpl implements ContractRequestsRepository {
  ContractRequestsRepositoryImpl();

  @override
  Future<Result<String>> createRequest(int contractId) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractRequestsRepo] createRequest: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractRequestsRepo] createRequest unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractRequestsEntity?>> readRequest(String token) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractRequestsRepo] readRequest: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractRequestsRepo] readRequest unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<List<ContractRequestsEntity>>> readRequests() async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractRequestsRepo] readRequests: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractRequestsRepo] readRequests unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> deleteRequest(int contractId) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ContractRequestsRepo] deleteRequest: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ContractRequestsRepo] deleteRequest unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }
}
