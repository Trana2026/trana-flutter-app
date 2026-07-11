import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/entities/user_inquiry_entity.dart';

part 'inquiry_view_model.freezed.dart';
part 'inquiry_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class InquiryState with _$InquiryState {
  const factory InquiryState({
    @Default([]) List<UserInquiryEntity> inquiries, // 문의 전체 목록
    UserInquiryEntity? selectedInquiryDetail, // 선택된 문의 상세 내용

    @Default('') String email, // 이메일 입력값
    @Default('') String title, // 문의 제목 입력값
    @Default('') String content, // 문의 내용 입력값

    @Default(false) bool isLoading,
    String? error,
  }) = _InquiryState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class InquiryViewModel extends _$InquiryViewModel {
  @override
  InquiryState build() => const InquiryState();

  /// 문의 전체 조회 (성공 여부 반환)
  Future<bool> readInquiries() async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(userInquiryRepositoryProvider)
        .readInquiries();

    state = switch (result) {
      Success(:final data) => state.copyWith(isLoading: false, inquiries: data),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  /// 선택된 문의 상세 조회 (성공 여부 반환)
  Future<bool> readInquiryDetail(String publicCode) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(userInquiryRepositoryProvider)
        .readInquiryDetail(publicCode);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoading: false,
        selectedInquiryDetail: data,
      ),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  /// 문의 내용 입력
  void updateEntries({
    required String email,
    required String title,
    required String content,
  }) {
    state = state.copyWith(email: email, title: title, content: content);
  }

  /// 문의 작성 (성공 여부 반환)
  Future<bool> createInquiry() async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(userInquiryRepositoryProvider)
        .createInquiry(
          email: state.email,
          title: state.title,
          content: state.content,
        );

    state = switch (result) {
      Success() => state.copyWith(isLoading: false),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    await readInquiries();

    return result is Success;
  }

  void clearError() => state = state.copyWith(error: null);
}
