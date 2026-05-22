import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_requests_entity.dart';
import 'package:trana/features/contract/domain/entities/contracts_entity.dart';
import 'package:trana/features/contract/domain/entities/pdf_entity.dart';

part 'contract_request_view_model.freezed.dart';
part 'contract_request_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class ContractRequestState with _$ContractRequestState {
  const factory ContractRequestState({
    @Default([]) List<ContractRequestsEntity> requests, // 계약 요청 목록
    ContractsEntity? receivedContract, // 수신된 계약 정보
    Uint8List? pdfBytes, // 생성된 Pdf 바이트
    @Default(false) bool isLoading,
    String? error,
  }) = _ContractRequestState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class ContractRequestViewModel extends _$ContractRequestViewModel {
  @override
  ContractRequestState build() {
    return const ContractRequestState();
  }

  /// 계약 요청 전송
  Future<void> sendRequest(int contractId) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractRequestsRepositoryProvider)
        .createRequest(contractId);

    switch (result) {
      case Failure(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
      case Success():
        state = state.copyWith(isLoading: false);
    }
  }

  /// 계약 요청 목록 불러오기
  Future<void> readRequests() async {
    final result = await ref
        .read(contractRequestsRepositoryProvider)
        .readRequests();

    switch (result) {
      case Failure(:final failure):
        state = state.copyWith(error: failure.message);
      case Success(:final data):
        state = state.copyWith(requests: data);
    }
  }

  /// 수신된 계약 정보 불러오기 + PDF 생성
  Future<void> readReceivedContract() async {
    if (state.requests.isEmpty) return;
    final contractId = state.requests.first.contractId;

    state = state.copyWith(isLoading: true);

    final contractResult = await ref
        .read(contractsRepositoryProvider)
        .readContract(contractId);
    final ContractsEntity contract;
    switch (contractResult) {
      case Failure(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
        return;
      case Success(:final data):
        contract = data;
    }

    final entries = PdfEntity(
      productName: contract.productName,
      amount: contract.amount,
      transactionMethod: contract.transactionMethod,
    );
    final pefResult = await ref
        .read(pdfRepositoryProvider)
        .generatePdf(entries);
    final Uint8List pdf;
    switch (pefResult) {
      case Failure(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
        return;
      case Success(:final data):
        pdf = data;
    }

    state = state.copyWith(
      isLoading: false,
      receivedContract: contract,
      pdfBytes: pdf,
    );
  }

  /// 계약 요청 삭제
  Future<void> deleteRequest(int contractId) async {
    final result = await ref
        .read(contractRequestsRepositoryProvider)
        .deleteRequest(contractId);

    switch (result) {
      case Failure(:final failure):
        state = state.copyWith(error: failure.message);
      case Success():
        state = state.copyWith(
          requests: state.requests
              .where((e) => e.contractId != contractId)
              .toList(),
        );
    }
  }

  void clearRequests() => state = state.copyWith(requests: []);

  void clearError() => state = state.copyWith(error: null);
}
