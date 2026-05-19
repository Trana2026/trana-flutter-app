import 'dart:io';

import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_parties_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_parties_repository.dart';

class ContractPartiesRepositoryImpl implements ContractPartiesRepository {
  @override
  Future<Result<void>> createContractParty(ContractPartiesEntity party) async {
    try {
      // TODO: implement createContractParty
      throw UnimplementedError();
    } on SocketException {
      return const Failure(NetworkFailure());
    } on UnauthorizedFailure {
      return const Failure(UnauthorizedFailure());
    } catch (e) {
      return Failure(UnknownFailure('계약 당사자 생성 실패: $e'));
    }
  }

  @override
  Future<Result<List<ContractPartiesEntity>>> readContractParties(
    int contractId,
  ) async {
    try {
      // TODO: implement readContractParties
      throw UnimplementedError();
    } on SocketException {
      return const Failure(NetworkFailure());
    } on UnauthorizedFailure {
      return const Failure(UnauthorizedFailure());
    } catch (e) {
      return Failure(UnknownFailure('계약 당사자 목록 조회 실패: $e'));
    }
  }

  @override
  Future<Result<ContractPartiesEntity>> readSender(int contractId) async {
    try {
      // TODO: implement readSender
      throw UnimplementedError();
    } on SocketException {
      return const Failure(NetworkFailure());
    } on UnauthorizedFailure {
      return const Failure(UnauthorizedFailure());
    } catch (e) {
      return Failure(UnknownFailure('판매자 조회 실패: $e'));
    }
  }

  @override
  Future<Result<void>> updateContractParty(ContractPartiesEntity party) async {
    try {
      // TODO: implement updateContractParty
      throw UnimplementedError();
    } on SocketException {
      return const Failure(NetworkFailure());
    } on UnauthorizedFailure {
      return const Failure(UnauthorizedFailure());
    } catch (e) {
      return Failure(UnknownFailure('계약 당사자 수정 실패: $e'));
    }
  }
}
