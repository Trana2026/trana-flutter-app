import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/features/profile/domain/enums/gender.dart';

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

  void clearError() => state = state.copyWith(error: null);
}
