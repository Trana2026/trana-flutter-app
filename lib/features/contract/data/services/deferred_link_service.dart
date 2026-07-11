import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_install_referrer/play_install_referrer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trana/features/contract/data/services/pending_invitation_token_service.dart';

/// Android Install Referrer 기반 초대 토큰 복구 서비스
class DeferredLinkService {
  static const _checkedKey = 'deferred_link_checked';

  /// 최초 1회 Install Referrer에서 초대 토큰 복구
  /// 안드로이드만 지원
  static Future<void> restoreInvitationToken() async {
    if (kIsWeb || !Platform.isAndroid) return;

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_checkedKey) ?? false) return;
    await prefs.setBool(_checkedKey, true);

    try {
      final details = await PlayInstallReferrer.installReferrer;
      final referrer = details.installReferrer;
      if (referrer == null || referrer.isEmpty) return;

      // Referrer에서 초대 토큰 추출
      final token = Uri.splitQueryString(referrer)['invite'];
      if (token == null || token.isEmpty) return;

      // 딥링크 토큰이 저장되어 있다면 우선 사용
      final existing = await PendingInvitationTokenService.get();
      if (existing != null) return;
      await PendingInvitationTokenService.save(token);
    } catch (e) {
      // Install Referrer 조회 실패
      debugPrint('[DeferredLinkService] restore failed: $e');
    }
  }
}
