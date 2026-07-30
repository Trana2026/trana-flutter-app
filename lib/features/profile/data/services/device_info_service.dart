import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ios_utsname_ext/extension.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:trana/features/profile/domain/enums/device_platform.dart';

// enum DeviceType { mobile, desktop }

class DeviceInfoService {
  static final _plugin = DeviceInfoPlugin();

  /// 기기 종류 (mobile, desktop)
  // static Future<DeviceType> getDeviceType() async {
  //   if (Platform.isAndroid || Platform.isIOS) return DeviceType.mobile;
  //   return DeviceType.desktop;
  // }

  /// 플랫폼 (android, ios)
  static Future<DevicePlatform> getPlatform() async {
    if (Platform.isAndroid) return DevicePlatform.android;
    if (Platform.isIOS) return DevicePlatform.ios;
    return DevicePlatform.etc;
  }

  /// 모델명 (ex. iPhone 13)
  static Future<String> getDeviceModel() async {
    if (Platform.isAndroid) {
      final info = await _plugin.androidInfo;
      return info.model;
    }

    if (Platform.isIOS) {
      final info = await _plugin.iosInfo;
      return info.utsname.machine.iOSProductName;
    }

    if (Platform.isMacOS) {
      final info = await _plugin.macOsInfo;
      return info.model;
    }

    if (Platform.isWindows) {
      final info = await _plugin.windowsInfo;
      return info.computerName;
    }

    if (Platform.isLinux) {
      final info = await _plugin.linuxInfo;
      return info.prettyName;
    }

    return "Unknown";
  }

  /// OS 버전 (ex. iOS 18.2, Android 14)
  static Future<String> getOsVersion() async {
    if (Platform.isAndroid) {
      final info = await _plugin.androidInfo;
      return 'Android ${info.version.release}';
    }

    if (Platform.isIOS) {
      final info = await _plugin.iosInfo;
      return '${info.systemName} ${info.systemVersion}';
    }

    return Platform.operatingSystemVersion;
  }

  /// 앱 버전 (ex. 1.2.3+45)
  static Future<String> getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    return '${info.version}+${info.buildNumber}';
  }

  /// 서버 기록용 기기 식별 User-Agent
  /// ex. iPhone 15 Pro; iOS 18.2 (Trana/1.0.0+1)
  static Future<String> getUserAgent() async {
    final (appVersion, osVersion, deviceModel) = await (
      getAppVersion(),
      getOsVersion(),
      getDeviceModel(),
    ).wait;
    return '$deviceModel; $osVersion (Trana/$appVersion)';
  }
}
