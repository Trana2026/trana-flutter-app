import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/entities/terms_content_entity.dart';
import 'package:trana/features/profile/domain/enums/terms_type.dart';

part 'term_detail_view_model.freezed.dart';
part 'term_detail_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class TermDetailState with _$TermDetailState {
  const factory TermDetailState({
    TermsContentEntity? content, // 조회된 약관 전문
    @Default(false) bool isLoading, // 약관 전문 조회 로딩중 여부
    String? error,
  }) = _TermDetailState;
}

// ==================== ViewModel ====================

@riverpod
class TermDetailViewModel extends _$TermDetailViewModel {
  @override
  TermDetailState build() => const TermDetailState();

  /// id로 약관 전문 조회 (성공 여부 반환)
  Future<bool> loadContent(int id) async {
    state = state.copyWith(isLoading: true);
    final result = await ref.read(termsRepositoryProvider).readTermContent(id);
    return _apply(result);
  }

  /// 타입으로 약관 전문 조회 (성공 여부 반환)
  Future<bool> loadContentByType(TermsType type) async {
    state = state.copyWith(isLoading: true);
    final result = await ref
        .read(termsRepositoryProvider)
        .readTermContentByType(type);
    return _apply(result);
  }

  /// 조회 결과를 상태에 반영
  bool _apply(Result<TermsContentEntity> result) {
    state = switch (result) {
      Success(:final data) => state.copyWith(isLoading: false, content: data),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };
    return result is Success;
  }

  void clearError() => state = state.copyWith(error: null);
}
