import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const _androidChannel = AndroidNotificationChannel(
  'high_importance_channel', // AndroidManifest.xml의 default_notification_channel_id와 반드시 동일해야 함
  '중요 알림',
  description: '계약 관련 알림을 즉시 보여줍니다',
  importance: Importance.high,
);

final _localNotifications = FlutterLocalNotificationsPlugin();

/// FCM 백그라운드/종료 상태 메시지 핸들러.
/// isolate 진입점이라 top-level 함수 + @pragma 필수 (클래스 메서드 불가)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class NotificationService {
  const NotificationService._();

  /// 앱 시작 시 1회 호출.
  /// 알림 권한 요청 (iOS 필수 / Android 13+ 필수) + 포그라운드 표시 설정
  static Future<void> initialize() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // iOS: 권한 승인 시 포그라운드 상태에서도 배너/사운드 표시
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_androidChannel);

    await _localNotifications.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        // iOS 알림 권한은 위 FirebaseMessaging.requestPermission()에서 이미 요청함 (중복 요청 방지)
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ),
    );

    // Android는 포그라운드 상태에서 FCM이 시스템 알림을 자동 표시하지 않으므로 직접 표시
    // (iOS는 위 setForegroundNotificationPresentationOptions가 처리)
    FirebaseMessaging.onMessage.listen((message) {
      if (!Platform.isAndroid) return;

      final notification = message.notification;
      if (notification == null) return;

      _localNotifications.show(
        id: notification.hashCode,
        title: notification.title,
        body: notification.body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }
}
