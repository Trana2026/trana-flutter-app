import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/ekyc/domain/entities/terms_entity.dart';
import 'package:trana/features/ekyc/domain/repositories/ekyc_repository.dart';

part 'terms_view_model.g.dart';

/// 약관 목록 조회 및 동의 처리 ViewModel
@riverpod
class TermsViewModel extends _$TermsViewModel {
  EkycRepository get _repository => ref.read(ekycRepositoryProvider);

  /// 앱 시작 시 활성 약관 목록 조회
  @override
  Future<List<TermsEntity>> build() async {
    final result = await _repository.getTerms();
    return switch (result) {
      Success(:final data) => data,
      Failure(:final failure) => throw failure,
    };
  }

  /// 약관 동의 후 signupSessionId 반환 (null이면 실패)
  Future<String?> submitConsent({required List<int> termsVersionIds}) async {
    final result = await _repository.submitConsent(
      termsVersionIds: termsVersionIds,
      contextType: 'SIGNUP',
      ageGroup: 'ADULT',
    );
    return switch (result) {
      Success(:final data) => data.signupSessionId,
      Failure() => null,
    };
  }
}
