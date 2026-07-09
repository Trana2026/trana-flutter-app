import 'package:firebase_messaging/firebase_messaging.dart';

class FcmService {
  static Future<String> getFcmToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    return token ?? "";
  }
}
