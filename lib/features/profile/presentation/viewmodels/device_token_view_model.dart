import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/data/services/device_info_service.dart';
import 'package:trana/features/profile/data/services/fcm_service.dart';
import 'package:trana/features/profile/domain/enums/device_platform.dart';
import 'package:trana/features/profile/presentation/viewmodels/my_page_view_model.dart';

part 'device_token_view_model.freezed.dart';
part 'device_token_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class DeviceTokenState with _$DeviceTokenState {
  const factory DeviceTokenState({
    @Default('') String token, // fcm 토큰
    DevicePlatform? platform, // 플랫폼
    @Default('') String deviceModel, // 모델명
    @Default('') String osVersion, // os 버전
    @Default('') String appVersion, // 앱 버전
    @Default(-1) int currentDeviceId, // 현재 사용중인 device id

    String? error,
  }) = _DeviceTokenState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class DeviceTokenViewModel extends _$DeviceTokenViewModel {
  @override
  DeviceTokenState build() => const DeviceTokenState();

  /// 현재 기기 정보 식별
  Future<void> getDeviceInfo() async {
    final (token, platform, deviceModel, osVersion, appVersion) = await (
      FcmService.getFcmToken(),
      DeviceInfoService.getPlatform(),
      DeviceInfoService.getDeviceModel(),
      DeviceInfoService.getOsVersion(),
      DeviceInfoService.getAppVersion(),
    ).wait;

    state = state.copyWith(
      token: token,
      platform: platform,
      deviceModel: deviceModel,
      osVersion: osVersion,
      appVersion: appVersion,
    );
  }

  /// FCM 디바이스 토큰 등록 > 현재 사용중인 device id 반환 (성공 여부 반환)
  Future<bool> registerToken() async {
    if (state.token.isEmpty || state.platform == null) {
      state = state.copyWith(error: "기기 정보를 찾을 수 없습니다");
      return false;
    }

    final result = await ref
        .read(deviceTokenRepositoryProvider)
        .createDeviceToken(
          token: state.token,
          platform: state.platform!,
          deviceModel: state.deviceModel,
          osVersion: state.osVersion,
          appVersion: state.appVersion,
        );

    state = switch (result) {
      Success(:final data) => state.copyWith(currentDeviceId: data),
      Failure(:final failure) => state.copyWith(error: failure.message),
    };

    return result is Success;
  }

  /// FCM 디바이스 토큰 해제 (성공 여부 반환)
  Future<bool> deleteToken() async {
    if (state.token.isEmpty) {
      state = state.copyWith(error: "토큰을 찾을 수 없습니다");
      return false;
    }

    final result = await ref
        .read(deviceTokenRepositoryProvider)
        .deleteDeviceToken(state.token);

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

    await _refresh();

    return result is Success;
  }

  /// 기기 활성 ping (성공 여부 반환)
  Future<bool> ping() async {
    if (state.token.isEmpty) {
      state = state.copyWith(error: "토큰을 찾을 수 없습니다");
      return false;
    }

    final result = await ref
        .read(deviceTokenRepositoryProvider)
        .ping(state.token);

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

    await _refresh();

    return result is Success;
  }

  /// 기기 강제 해제 (성공 여부 반환)
  Future<bool> disconnect(int id) async {
    final result = await ref.read(deviceTokenRepositoryProvider).disconnect(id);

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
    }

    await _refresh();

    return result is Success;
  }

  Future<void> _refresh() async {
    final mypageVM = ref.read(myPageViewModelProvider.notifier);
    await mypageVM.loadData();
  }

  void clearError() => state = state.copyWith(error: null);
}
