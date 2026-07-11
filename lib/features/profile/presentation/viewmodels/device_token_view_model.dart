import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/data/services/device_info_service.dart';
import 'package:trana/features/profile/data/services/fcm_service.dart';
import 'package:trana/features/profile/presentation/viewmodels/my_page_view_model.dart';

part 'device_token_view_model.freezed.dart';
part 'device_token_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class DeviceTokenState with _$DeviceTokenState {
  const factory DeviceTokenState({
    @Default('') String token, // fcm 토큰

    @Default(false) bool isLoading,
    String? error,
  }) = _DeviceTokenState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class DeviceTokenViewModel extends _$DeviceTokenViewModel {
  @override
  DeviceTokenState build() => const DeviceTokenState();

  /// FCM 디바이스 토큰 등록 (성공 여부 반환)
  Future<bool> registerToken() async {
    state = state.copyWith(isLoading: true);

    final token = await FcmService.getFcmToken();
    final platform = await DeviceInfoService.getPlatform();

    final result = await ref
        .read(deviceTokenRepositoryProvider)
        .createDeviceToken(token: token, platform: platform);

    state = switch (result) {
      Success() => state.copyWith(isLoading: false, token: token),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  /// FCM 디바이스 토큰 해제 (성공 여부 반환)
  Future<bool> deleteToken() async {
    if (state.token.isEmpty) {
      state = state.copyWith(error: "토큰을 찾을 수 없습니다");
      return false;
    }

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(deviceTokenRepositoryProvider)
        .deleteDeviceToken(state.token);

    state = switch (result) {
      Success() => state.copyWith(isLoading: false),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    await _refresh();

    return result is Success;
  }

  /// 기기 활성 ping (성공 여부 반환)
  Future<bool> ping() async {
    if (state.token.isEmpty) {
      state = state.copyWith(error: "토큰을 찾을 수 없습니다");
      return false;
    }

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(deviceTokenRepositoryProvider)
        .ping(state.token);

    state = switch (result) {
      Success() => state.copyWith(isLoading: false),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    await _refresh();

    return result is Success;
  }

  /// 기기 강제 해제 (성공 여부 반환)
  Future<bool> disconnect(int id) async {
    state = state.copyWith(isLoading: true);

    final result = await ref.read(deviceTokenRepositoryProvider).disconnect(id);

    state = switch (result) {
      Success() => state.copyWith(isLoading: false),
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
