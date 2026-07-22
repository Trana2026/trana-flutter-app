import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/guardian/domain/entities/guardian_link_entity.dart';
import 'package:trana/features/guardian/domain/repositories/guardian_repository.dart';
import 'package:trana/features/user/domain/repositories/user_repository.dart';

part 'guardian_view_model.g.dart';

/// 보호자 링크 발급 및 인증 완료 폴링 ViewModel
@riverpod
class GuardianViewModel extends _$GuardianViewModel {
  GuardianRepository get _repository => ref.read(guardianRepositoryProvider);
  UserRepository get _userRepository => ref.read(userRepositoryProvider);
  Timer? _pollingTimer;
  int _pollingToken = 0;

  /// 초기 상태 null (링크 미발급). dispose 시 폴링 타이머 자동 취소
  @override
  AsyncValue<GuardianLinkEntity?> build() {
    ref.onDispose(() => _pollingTimer?.cancel());
    return const AsyncData(null);
  }

  /// 보호자 인증 딥링크 생성 후 verifyUrl 반환 (token/expiresAt: secure storage)
  Future<String?> createLink() async {
    // ref는 비동기(링크 생성) 이전에 모두 읽어둠
    // autoDispose라 긴 await 동안 provider가 dispose되면 await 이후 ref.read할때 터짐
    final repository = _repository;
    final linkStore = ref.read(guardianLinkStoreProvider);

    final result = await repository.createGuardianLink();
    if (result case Success(:final data)) {
      await linkStore.save(token: data.token, expiresAt: data.expiresAt);
      return data.verifyUrl;
    }
    return null;
  }

  /// 5초 간격으로 guardianVerifiedAt 폴링. 완료 시 onComplete 호출
  /// 시작 시 이미 완료된 상태일 수 있으므로 타이머 등록 전 즉시 한 번 확인
  /// (Timer.periodic은 최초 실행도 간격만큼 지난 뒤에야 발생하기 때문)
  void startPolling({required void Function() onComplete}) {
    _pollingTimer?.cancel();
    final token = ++_pollingToken;

    Future<bool> checkOnce() async {
      final result = await _userRepository.getMe();
      if (result case Success(:final data)) {
        if (data.guardianVerifiedAt != null) {
          onComplete();
          return true;
        }
      }
      return false;
    }

    checkOnce().then((completed) {
      // 대기 중 stopPolling되거나 startPolling이 다시 호출됐다면 타이머를 새로 걸지 않는다
      if (completed || token != _pollingToken) return;
      _pollingTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
        if (await checkOnce()) {
          _pollingTimer?.cancel();
        }
      });
    });
  }

  /// 폴링 타이머 취소
  void stopPolling() {
    _pollingTimer?.cancel();
    _pollingToken++;
  }
}
