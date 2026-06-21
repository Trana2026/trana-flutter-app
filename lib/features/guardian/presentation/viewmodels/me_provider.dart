import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/guardian/domain/entities/user_me_entity.dart';

part 'me_provider.g.dart';

/// 현재 사용자 조회. 홈 보호자 UI 노출 판단용 (실패/미로그인 시 null)
@riverpod
Future<UserMeEntity?> me(Ref ref) async {
  final result = await ref.read(guardianRepositoryProvider).getMe();
  return result.dataOrNull;
}
