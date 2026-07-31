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

    String? selectedTitle, // 선택된 문의의 제목
    String? selectedContent, // 선택된 문의의 상세 내용

    @Default('') String email, // 이메일 입력값
    @Default('') String title, // 문의 제목 입력값
    @Default('') String content, // 문의 내용 입력값

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
    final result = await ref
        .read(userInquiryRepositoryProvider)
        .readInquiries();

    state = switch (result) {
      Success(:final data) => state.copyWith(inquiries: data),
      Failure(:final failure) => state.copyWith(error: failure.message),
    };

    return result is Success;
  }

  /// 선택된 문의 상세 조회 (성공 여부 반환)
  Future<bool> readInquiryDetail(String publicCode) async {
    final result = await ref
        .read(userInquiryRepositoryProvider)
        .readInquiryDetail(publicCode);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        selectedTitle: data.title,
        selectedContent: data.content,
      ),
      Failure(:final failure) => state.copyWith(error: failure.message),
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
    final result = await ref
        .read(userInquiryRepositoryProvider)
        .createInquiry(
          email: state.email,
          title: state.title,
          content: state.content,
        );

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

    await readInquiries();

    return result is Success;
  }

  void clearError() => state = state.copyWith(error: null);
}
