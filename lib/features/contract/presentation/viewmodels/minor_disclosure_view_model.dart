import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_minor_disclosure_entity.dart';

part 'minor_disclosure_view_model.freezed.dart';
part 'minor_disclosure_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class MinorDisclosureState with _$MinorDisclosureState {
  const factory MinorDisclosureState({
    ContractMinorDisclosureEntity? disclosureText, // 위험 고지 문구
    DateTime? confirmedAt, // 확인 완료 시각

    @Default(false) bool isLoadingDisclosureText, // 위험 고지 문구 조회 로딩중 여부
    String? error,
  }) = _MinorDisclosureState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class MinorDisclosureViewModel extends _$MinorDisclosureViewModel {
  @override
  MinorDisclosureState build() => const MinorDisclosureState();

  /// 미성년자 위험 고지 문구 조회 (성공 여부 반환)
  Future<bool> readText() async {
    state = state.copyWith(isLoadingDisclosureText: true);

    final result = await ref
        .read(contractMinorDisclosureRepositoryProvider)
        .readLatest();

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoadingDisclosureText: false,
        disclosureText: data,
      ),
      Failure(:final failure) => state.copyWith(
        isLoadingDisclosureText: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  /// 미성년자 위험 고지 확인 (성공 여부 반환)
  Future<bool> confirm(String publicCode) async {
    if (state.disclosureText == null) {
      state = state.copyWith(error: "위험 고지 문구를 찾을 수 없습니다");
      return false;
    }

    final result = await ref
        .read(contractMinorDisclosureRepositoryProvider)
        .confirm(
          publicCode: publicCode,
          disclosedAt: DateTime.now(),
          templateVersion: state.disclosureText!.version,
        );

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

    return result is Success;
  }

  void clearError() => state = state.copyWith(error: null);
}
