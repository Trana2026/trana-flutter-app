import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/entities/blocked_user_entity.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'block_view_model.freezed.dart';
part 'block_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class BlockState with _$BlockState {
  const factory BlockState({
    @Default([]) List<BlockedUserEntity> blocks, // 내가 차단한 사용자 목록

    String? error,
  }) = _BlockState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class BlockViewModel extends _$BlockViewModel {
  @override
  BlockState build() => const BlockState();

  /// 내가 차단한 사용자 목록 조회 (성공 여부 반환)
  Future<bool> readBlocks() async {
    final result = await ref.read(blockRepositoryProvider).readBlocks();

    state = switch (result) {
      Success(:final data) => state.copyWith(blocks: data),
      Failure(:final failure) => state.copyWith(error: failure.message),
    };

    return result is Success;
  }

  /// 계약 상대방 차단 (성공 여부 반환)
  Future<bool> blockContractCounterpart(String publicCode) async {
    final result = await ref
        .read(blockRepositoryProvider)
        .blockContractCounterpart(publicCode);

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
      return false;
    }

    await readBlocks();
    // await _refreshHome();

    return true;
  }

  /// 차단 해제 (성공 여부 반환)
  Future<bool> unblock(String shareCode) async {
    final result = await ref.read(blockRepositoryProvider).unblock(shareCode);

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
      return false;
    }

    await readBlocks();
    await _refreshHome();

    return result is Success;
  }

  Future<void> _refreshHome() async {
    final homeContractVM = ref.read(homeContractViewModelProvider.notifier);
    await homeContractVM.readMyContracts();
  }

  void clearError() => state = state.copyWith(error: null);
}
