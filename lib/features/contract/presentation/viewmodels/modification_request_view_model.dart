import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'modification_request_view_model.freezed.dart';
part 'modification_request_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class ModificationRequestState with _$ModificationRequestState {
  const factory ModificationRequestState({
    @Default(<String>{}) Set<String> selectedFields, // 선택한 영역 이름 목록
    @Default('') String deliveryTypeReason,
    @Default('') String platformReason,
    @Default('') String titleReason,
    @Default('') String priceReason,
    @Default('') String conditionSummaryReason,
    @Default('') String conditionDetailsReason,

    @Default(false) bool isLoading,
    String? error,
  }) = _ModificationRequestState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class ModificationRequestViewModel extends _$ModificationRequestViewModel {
  @override
  ModificationRequestState build() => const ModificationRequestState();

  void updateSelectedFields(Set<String> fields) =>
      state = state.copyWith(selectedFields: fields);

  void submitReasons(Map<String, String> reasons) {
    state = state.copyWith(
      platformReason: reasons['거래 플랫폼'] ?? state.platformReason,
      deliveryTypeReason: reasons['거래 방식'] ?? state.deliveryTypeReason,
      titleReason: reasons['거래 물품명'] ?? state.titleReason,
      priceReason: reasons['거래 금액'] ?? state.priceReason,
      conditionSummaryReason: reasons['상품 상태'] ?? state.conditionSummaryReason,
      conditionDetailsReason:
          reasons['상품 상세 설명'] ?? state.conditionDetailsReason,
    );
  }

  /// 수정 요청 (성공 여부 반환)
  Future<bool> requestRevision(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(contractInvitationRepositoryProvider)
        .requestRevision(
          publicCode: publicCode,
          titleReason: state.titleReason,
          priceReason: state.priceReason,
          conditionSummaryReason: state.conditionSummaryReason,
          conditionDetailsReason: state.conditionDetailsReason,
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
