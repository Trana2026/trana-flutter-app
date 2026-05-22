import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/features/contract/presentation/viewmodels/contract_request_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

part 'current_user_provider.g.dart';

/// 현재 사용자의 userId 불러오기 provider (임시, 테스트용)
@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  int build() => 1;

  /// 요청자(userId = 1), 수신자(userId = 2) 간 전환
  Future<void> switchUser() async {
    state = state == 1 ? 2 : 1;

    // 수신자로 전환 시 대기 중인 계약 요청 목록 로드, 요청자로 돌아오면 초기화
    final requestVM = ref.read(contractRequestViewModelProvider.notifier);
    if (state == 2) {
      await requestVM.readRequests();
    } else {
      requestVM.clearRequests();
    }

    // 현재 사용자에 따른 최근 계약 목록 로드
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    await homeVM.readContractSummaries();
  }
}
