import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_dispute_entity.dart';
import 'package:trana/features/contract/domain/enums/dispute_state.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'report_contract_view_model.freezed.dart';
part 'report_contract_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class ReportContractState with _$ReportContractState {
  const factory ReportContractState({
    @Default('') String reason, // 신고 사유
    @Default('') String detail, // 상세 내용

    ContractDisputeEntity? recentReport, // 최근 신고 내역

    @Default(false) bool isLoading,
    String? error,
  }) = _ReportContractState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class ReportContractViewModel extends _$ReportContractViewModel {
  @override
  ReportContractState build() => const ReportContractState();

  void updateInput({required String reason, required String detail}) =>
      state = state.copyWith(reason: reason, detail: detail);

  /// 신고 접수 (성공 여부 반환)
  Future<bool> report(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractDisputeRepositoryProvider)
        .reportDispute(
          publicCode: publicCode,
          reason: state.reason,
          detail: state.detail,
        );

    state = switch (result) {
      Success() => state.copyWith(isLoading: false),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    if (result is Success) {
      await _refresh(publicCode);
    }

    return result is Success;
  }

  /// 최근 신고 내용 조회 (성공 여부 반환)
  Future<bool> readReport(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractDisputeRepositoryProvider)
        .readDisputes(publicCode);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoading: false,
        recentReport: data
            .where((d) => d.status == DisputeState.reported)
            .firstOrNull,
      ),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  /// 신고 취소 (성공 여부 반환)
  Future<bool> cancelReport(String publicCode) async {
    if (state.recentReport == null) {
      state = state.copyWith(error: "신고 정보를 찾을 수 없습니다");
      return false;
    }

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractDisputeRepositoryProvider)
        .cancelDispute(
          publicCode: publicCode,
          disputeId: state.recentReport!.disputeId,
        );

    state = switch (result) {
      Success() => state.copyWith(isLoading: false),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    if (result is Success) {
      await _refresh(publicCode);
    }

    return result is Success;
  }

  Future<void> _refresh(String? publicCode) async {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    await homeVM.readMyContracts();

    if (publicCode == null) return;

    final detailVM = ref.read(detailContractViewModelProvider.notifier);
    await detailVM.loadDetail(publicCode);
  }

  void clearError() => state = state.copyWith(error: null);
}
