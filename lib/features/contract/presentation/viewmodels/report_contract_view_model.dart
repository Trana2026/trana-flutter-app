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
    @Default('') String reason, // 신고 사유 입력값
    @Default('') String detail, // 상세 내용 입력값

    int? recentReportId, // 최근 신고 ID
    String? recentReportReason, // 최근 신고 사유
    String? recentReportDetail, // 최근 신고 상세 내용
    @Default(false) bool recentReportIsMine, // 최근 신고가 본인 신고인지 여부

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
    final result = await ref
        .read(contractDisputeRepositoryProvider)
        .reportDispute(
          publicCode: publicCode,
          reason: state.reason,
          detail: state.detail,
        );

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

    if (result is Success) {
      await _refresh(publicCode);
      await readReport(publicCode);
    }

    return result is Success;
  }

  /// 최근 신고 내용 조회 (성공 여부 반환)
  Future<bool> readReport(String publicCode) async {
    final result = await ref
        .read(contractDisputeRepositoryProvider)
        .readDisputes(publicCode);

    state = switch (result) {
      Success(:final data) => _applyRecentReport(
        data.where((d) => d.status == DisputeState.reported).firstOrNull,
      ),
      Failure(:final failure) => state.copyWith(error: failure.message),
    };

    return result is Success;
  }

  ReportContractState _applyRecentReport(ContractDisputeEntity? recent) =>
      state.copyWith(
        recentReportId: recent?.disputeId,
        recentReportReason: recent?.reason,
        recentReportDetail: recent?.detail,
        recentReportIsMine: recent?.isMine ?? false,
      );

  /// 신고 취소 (성공 여부 반환)
  Future<bool> cancelReport(String publicCode) async {
    if (state.recentReportId == null) {
      state = state.copyWith(error: "신고 정보를 찾을 수 없습니다");
      return false;
    }

    final result = await ref
        .read(contractDisputeRepositoryProvider)
        .cancelDispute(
          publicCode: publicCode,
          disputeId: state.recentReportId!,
        );

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

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
