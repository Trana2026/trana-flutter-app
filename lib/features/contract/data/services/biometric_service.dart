import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  /// 생체 인증 사용가능 여부
  Future<bool> canAuthenticate() async {
    try {
      return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
    } catch (_) {
      return false;
    }
  }

  /// 생체 인증
  Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: '본인 확인을 위해 생체 인증을 진행해주세요.',
        biometricOnly: true,
        persistAcrossBackgrounding: true,
      );
    } catch (e) {
      return false;
    }
  }
}
