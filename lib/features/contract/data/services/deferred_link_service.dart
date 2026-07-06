import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_install_referrer/play_install_referrer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trana/features/contract/data/services/pending_invitation_token_service.dart';

/// 앱 미설치 상태에서 초대 링크로 설치한 유저의 초대 토큰 복구 (Android Install Referrer)
class DeferredLinkService {
  static const _checkedKey = 'deferred_link_checked';

  /// 최초 1회 Install Referrer에서 invite 토큰을 회수해 pending 저장 (iOS는 없음)
  static Future<void> restoreInvitationToken() async {
    if (kIsWeb || !Platform.isAndroid) return;

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_checkedKey) ?? false) return;
    await prefs.setBool(_checkedKey, true);

    try {
      final details = await PlayInstallReferrer.installReferrer;
      final referrer = details.installReferrer;
      if (referrer == null || referrer.isEmpty) return;

      // 랜딩 페이지가 붙인 referrer: "invite={초대토큰}" (utm 파라미터와 병행 사용 가능)
      final token = Uri.splitQueryString(referrer)['invite'];
      if (token == null || token.isEmpty) return;

      // 딥링크로 이미 토큰이 저장돼 있으면 그쪽을 우선
      final existing = await PendingInvitationTokenService.get();
      if (existing != null) return;
      await PendingInvitationTokenService.save(token);
    } catch (e) {
      // referrer 미지원 기기/스토어 외 설치 등 일단 무시
      debugPrint('[DeferredLinkService] restore failed: $e');
    }
  }
}
