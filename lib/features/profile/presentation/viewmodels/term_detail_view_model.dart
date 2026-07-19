import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/enums/terms_type.dart';

part 'term_detail_view_model.freezed.dart';
part 'term_detail_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class TermDetailState with _$TermDetailState {
  const factory TermDetailState({
    // 선택된 약관 정보
    @Default(-1) int id,
    TermsType? type,
    @Default('') String version,
    @Default('') String title,
    @Default('') String contentUrl,
    DateTime? effectiveAt,

    @Default(false) bool isLoadingTerm, // 약관 단일 조회 로딩중 여부
    String? error,
  }) = _TermDetailState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class TermDetailViewModel extends _$TermDetailViewModel {
  @override
  TermDetailState build() => const TermDetailState();

  /// 타입별 약관 단일 조회 (성공 여부 반환)
  Future<bool> readTermByType(TermsType type) async {
    state = state.copyWith(isLoadingTerm: true);

    final result = await ref.read(termsRepositoryProvider).readTermByType(type);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoadingTerm: false,
        id: data.id,
        type: type,
        version: data.version,
        title: data.title,
        contentUrl: data.contentUrl,
        effectiveAt: data.effectiveAt,
      ),
      Failure(:final failure) => state.copyWith(
        isLoadingTerm: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  void clearError() => state = state.copyWith(error: null);
}
