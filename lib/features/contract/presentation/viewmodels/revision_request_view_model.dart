import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'revision_request_view_model.freezed.dart';
part 'revision_request_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class RevisionRequestState with _$RevisionRequestState {
  const factory RevisionRequestState({
    @Default(<String>{}) Set<String> selectedFields, // 선택한 영역 이름 목록
    // 각 영역 수정 요청 내용
    @Default('') String deliveryTypeReason,
    @Default('') String tradingPlatformReason,
    @Default('') String titleReason,
    @Default('') String priceReason,
    @Default('') String conditionSummaryReason,
    @Default('') String conditionDetailsReason,

    @Default(false) bool revisionDone, // 수정 완료 여부

    String? error,
  }) = _RevisionRequestState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class RevisionRequestViewModel extends _$RevisionRequestViewModel {
  @override
  RevisionRequestState build() => const RevisionRequestState();

  /// 수정 요청 필드 선택
  void updateSelectedFields(Set<String> fields) =>
      state = state.copyWith(selectedFields: fields);

  /// 수정 요청 내용 입력
  void submitReasons(Map<String, String> reasons) {
    state = state.copyWith(
      deliveryTypeReason: reasons['거래 방식'] ?? state.deliveryTypeReason,
      tradingPlatformReason: reasons['거래 플랫폼'] ?? state.tradingPlatformReason,
      titleReason: reasons['거래 물품명'] ?? state.titleReason,
      priceReason: reasons['거래 금액'] ?? state.priceReason,
      conditionSummaryReason: reasons['상품 상태'] ?? state.conditionSummaryReason,
      conditionDetailsReason:
          reasons['상품 상세 설명'] ?? state.conditionDetailsReason,
    );
  }

  /// 수정 완료 상태 변경
  void revisionDone(bool v) => state = state.copyWith(revisionDone: v);

  /// 수정 요청 (성공 여부 반환)
  Future<bool> requestRevision(String publicCode) async {
    final result = await ref
        .read(contractInvitationRepositoryProvider)
        .revisions(
          publicCode: publicCode,
          deliveryTypeReason: state.deliveryTypeReason,
          tradingPlatformReason: state.tradingPlatformReason,
          titleReason: state.titleReason,
          priceReason: state.priceReason,
          conditionSummaryReason: state.conditionSummaryReason,
          conditionDetailsReason: state.conditionDetailsReason,
        );

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

    if (result is Success) {
      await _refresh(publicCode);
    }

    return result is Success;
  }

  /// 최신 수정 요청 내용 불러오기 (성공 여부 반환)
  Future<bool> getLatestRevisionReason(String publicCode) async {
    final result = await ref
        .read(contractInvitationRepositoryProvider)
        .latest(publicCode: publicCode);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        deliveryTypeReason: data.deliveryTypeReason ?? '',
        tradingPlatformReason: data.tradingPlatformReason ?? '',
        titleReason: data.titleReason ?? '',
        priceReason: data.priceReason ?? '',
        conditionSummaryReason: data.conditionSummaryReason ?? '',
        conditionDetailsReason: data.conditionDetailsReason ?? '',
      ),
      Failure(:final failure) => state.copyWith(error: failure.message),
    };

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
