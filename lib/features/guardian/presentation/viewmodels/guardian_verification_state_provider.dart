import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/features/guardian/domain/entities/guardian_verification_state.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';

part 'guardian_verification_state_provider.g.dart';

/// 보호자 인증 상태 파생. me(인증완료여부) + 저장된 링크(token/expiresAt)를 통해 상태 결정
@riverpod
Future<GuardianVerificationState> guardianVerificationState(Ref ref) async {
  final me = await ref.watch(meProvider.future);
  if (me?.guardianVerifiedAt != null) {
    return GuardianVerificationState.verified;
  }

  final store = ref.read(guardianLinkStoreProvider);
  final token = await store.readToken();
  if (token == null || token.isEmpty) {
    return GuardianVerificationState.notIssued;
  }

  final expiresAt = await store.readExpiresAt();
  if (expiresAt != null && expiresAt.isAfter(DateTime.now())) {
    return GuardianVerificationState.pending;
  }
  return GuardianVerificationState.expired;
}
