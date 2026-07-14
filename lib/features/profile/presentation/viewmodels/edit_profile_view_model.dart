import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/enums/gender.dart';
import 'package:trana/features/profile/presentation/viewmodels/my_page_view_model.dart';

part 'edit_profile_view_model.freezed.dart';
part 'edit_profile_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    Gender? gender, // 성별 선택값
    @Default('') String email, // 이메일 입력값

    @Default(false) bool isLoading,
    String? error,
  }) = _EditProfileState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class EditProfileViewModel extends _$EditProfileViewModel {
  @override
  EditProfileState build() => const EditProfileState();

  /// 성별 선택값 변경
  void updateGender(Gender? v) => state = state.copyWith(gender: v);

  /// 이메일 입력값 변경
  void updateEmail(String v) => state = state.copyWith(email: v);

  /// 본인 정보 수정 (성공 여부 반환)
  Future<bool> updateProfile() async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(userInfoRepositoryProvider)
        .updateProfile(email: state.email, gender: state.gender);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoading: false,
        email: data.email ?? '',
        gender: data.gender,
      ),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    await _refresh();

    return result is Success;
  }

  Future<void> _refresh() async {
    final mypageVM = ref.read(myPageViewModelProvider.notifier);
    await mypageVM.loadData();
  }

  void clearError() => state = state.copyWith(error: null);
}
